# Accessing LPC functions from Merry

As described in [Layers of the SkotOS Server](./../../../Maintainer/Layers.md), the DGD layer, by default, is not accessible at the Story Builder (Merry) level. However, there are some instances where Story Builders need to access these lower level LPC functions. The most common reason for this is to store or retrieve **UDat** information. 

Since UDats can contain personal identifiable infrmation, we have a responsibility to protect this information from just anyone. Other non-PII UDat information, such as account status and character roster, should be accessible by Story Builders. So how do we hide some information from Story Builders while also letting them see the rest?

## Layers Overview

The SkotOS layers can be broken down into:

1. DGD Layer
2. Kernel Layer
3. LPC Layer
4. Story Builder Layer (Merry, SAM, Woe)
5. Outer Layer (Web Server and Browser)

*(Please see [Layers of the SkotOS Server](./../../../Maintainer/Layers.md) for a more comprehensive explanation of the different SkotOS layers.)*


### LPC Layer

Objects and libraries within the skoot folder, such as the ones we use for UDats, reside at the LPC layer. For UDats, there are two key files: **/skoot/usr/UserAPI/obj/udat.c** and **/skoot/usr/UserAPI/sys/udatd.c**.

**/skoot/usr/UserAPI/obj/udat.c**

Anything within an **obj** folder is an object and multiple copies can be spawned. So with UDats, udat.c is the object that gets spawned when a new account is created and all user data gets stored in this object. 

For these objects to be visible in Tree of Woe, they must be given an object name with the *set_object_name()* function.

```
/skoot/usr/UserAPI/obj/udat.c

...
atomic void set_name(string str) {
   if (previous_program() == UDATD) {
      name = str;
      patch_object_name();
   }
}

void patch_object_name() {
   set_object_name("UserAPI:UDats:" + name[0 .. 0] + ":" + name);
}
...

```

Although, this object can be viewed in Tree of Woe, this does not mean the data within udat.c are accessible. SIDs are what determine what we can see in Tree of Woe and we'll talk about those a little later on. 

The methods in this object:
   * Initialize the udat
   * Store and retrieve information in the udat
   
These methods can only be used to manipulate the data of the object where it belongs. We need a separate library, visible to the Story Builder level, to be able to call on different UDats and access its methods.

**/skoot/usr/UserAPI/sys/udatd.c**

This is the UDat library and plays an integral role in allowing Story Builders to access UDat information. 

Key functions of this library:
   * create()
   * query_method()
   * call_method()
   

#### create()

This function is called when the file is loaded on bootup.

```
static
void create() {
    int i;

    set_object_name("UserAPI:UDatD");

    udats_arr = allocate(256);
    email_arr = allocate(256);
    for (i = 0; i < 256; i++) {
	udats_arr[i] = ([ ]);
	email_arr[i] = ([ ]);
    }

    setup_db();

    compile_object(UDAT);

    authapi::create();
    module::create("SAM");
}
```

This function gives the library a Tree of Woe path: UserAPI:UDatD. However, just like with the udat object, this doesn't mean its functions are accessible to the Story Builder. 

#### query_method()

If the Story Builder were to attempt something like Call(${UserAPI:UDatD}, "some_function") it would make it to the udatd.c library but nothing would happen unless "some_function" were defined in query_method(). This is how we filter out which data that we want to be manipulated by the Story Builder.

```
int query_method(string method) {
   switch(lower_case(method)) {
   case "add_name_for_body":
   case "remove_name_for_body":
   case "query_names_of_body":
   case "query_name_of_body":
   case "add_body_to_roster":
   case "remove_body_from_roster":
   case "query_bodies_in_roster":
   case "query_udat":
   case "search_udat":
   case "udat_ipdata":
   case "server_lock":
   case "udat_list":
   case "set_suspended":
   case "query_suspended":
   case "addnote":
   case "killnote":
   case "notes":
      return TRUE;
   default:
   return FALSE;
   }
}
```

When this function returns FALSE, it will give an error message stating that "some_function" does not exist. If it returns TRUE, it will call the call_method() function.

#### call_method()

```
mixed
call_method(string method, mapping args) {
   switch(lower_case(method)) {
   case "add_name_for_body":
      if (typeof(args["body"]) != T_OBJECT) {
	 error("set_body_name expects $body");
      }
      if (typeof(args["name"]) != T_STRING) {
	 error("set_body_name expects $name");
      }
      add_name_for_body(args["body"], args["name"], !!args["primary"]);
      return nil;
   case "remove_name_for_body":
      if (typeof(args["body"]) != T_OBJECT) {
	 error("remove_body_name expects $body");
      }
      if (typeof(args["name"]) != T_STRING) {
	 error("remove_body_name expects $name");
      }
      remove_name_for_body(args["body"], args["name"]);
      return nil;
   case "query_names_of_body":
      if (typeof(args["body"]) != T_OBJECT) {
	 error("query_names_of_body expects $body");
      }
      /* do not return the private pointer! */
      return copy(query_names_of_body(args["body"]));
   case "query_name_of_body":
      if (typeof(args["body"]) != T_OBJECT) {
	 error("query_name_of_body expects $body");
      }
      return query_name_of_body(args["body"]);
   case "add_body_to_roster":
      if (typeof(args["body"]) != T_OBJECT) {
	 error("add_body_to_roster expects $body");
      }
      if (typeof(args["user"]) != T_STRING) {
	 error("add_body_to_roster expects $user");
      }
      add_body_to_roster(args["body"], args["user"]);
      return nil;
   case "remove_body_from_roster":
      if (typeof(args["body"]) != T_OBJECT) {
	 error("remove_body_from_roster expects $body");
      }
      if (typeof(args["user"]) != T_STRING) {
	 error("remove_body_from_roster expects $user");
      }
      remove_body_from_roster(args["body"], args["user"]);
      return nil;
   case "query_bodies_in_roster":
      if (typeof(args["user"]) != T_STRING) {
	 error("query_bodies_in_roster expects $user");
      }
      return query_bodies_in_roster(args["user"]);
   case "query_udat":
      if (typeof(args["name"]) != T_STRING) {
	 error("query_udat expects $name");
      }
      return query_udat(args["name"]);
   case "search_udat":
      if (typeof(args["field"]) != T_STRING) {
	 error("search_udat expects $field");
      }
      if (typeof(args["pattern"]) != T_STRING) {
	 error("search_udat expects $pattern");
      }
      return "~UserAPI/sys/searchdb"->query_matches(args["field"], args["pattern"]);
   case "udat_ipdata":
      if (typeof(args["name"]) != T_STRING) {
	 error("udat_ipdata expects $name");
      }
      if (typeof(args["category"]) != T_STRING) {
	 error("udat_ipdata expects $category");
      }
      if (!query_udat(args["name"])) {
	 return nil;
      }
      return copy(query_udat(args["name"])->query_last_ip_numbers(args["category"]));
   case "server_lock":
      if (typeof(args["locked"]) != T_INT) {
	 return server_locked;
      }
      server_locked = !!args["locked"];
      return server_locked;
   case "udat_list":
     return query_udats();
   case "set_suspended":
     set_suspended(args["reason"], args["user"], args["head"], args["desc"]);
     return nil;
   case "query_suspended":
     return query_suspended(args["user"]);
   case "addnote":
     addnote(args["user"], args["note"], args["body"], args["timestamp"], args["head"], args["desc"]);
     return nil;
   case "killnote":
     killnote(args["user"], args["head"], args["desc"]);
     return nil;
   case "notes":
     return notes(args["user"]);
   default:
      return nil;
   }
}
```

This function is used to process the arguments that were passed to us by the Merry call. Either by returning the data it is requesting or by calling other functions that perform complex actions. It can also be used to perform error checks to ensure the appropriate arguments are being passed.

### Story Builder Layer

So at this point we know how to access certain data and methods from Merry. Next we will go over how to view an object's data in Tree of Woe.

#### State Interface Definitions (SID)

A SID is an object that supplies some structural and datatype information for a specific class. It also determines what functions may be called in an object to acquire its state. Most object classes utilize multiple SIDs. The SIDs also determine how an object is displayed in Tree of Woe.

By now we know that all UDats are given a Tree of Woe path upon creation.

```
set_object_name("UserAPI:UDats:" + name[0 .. 0] + ":" + name);
```

And we know that the state root of the UDat Tree of Woe object is defined thusly:

```
string query_state_root() { return "UserAPI:UDat"; }
```

*The state root definition is how we assign SIDs to LPC objects.*

Let's take a look at the UDat SID:

```
<object clone="/usr/SID/obj/sidnode" owner="SID">
  <SID:Element ns="UserAPI" tag="UDat" recpoint="false" transient="true">
    <SID:Children>
      <SID:Child node="OBJ(SID:Core:Properties)"/>
      <SID:Child node="OBJ(SID:UserAPI:Suspended)"/>
      <SID:Child node="OBJ(SID:UserAPI:Bodies)"/>
      <SID:Child node="OBJ(SID:UserAPI:Notes)"/>
    </SID:Children>
    <SID:Attributes/>
    <SID:Iterator/>
    <SID:Callbacks/>
  </SID:Element>
</object>
```

The UDat object is linked to the SID by the SID's namespace (ns) and tag. Please see [State Interface Definitions](./../../../Developer/SID.md) for a more comprehensive explanation of SIDs and how they display a class' data to the user.

## Summary

To access LPC library functions from Merry, the following must be true:
   1. The library must have a Tree of Woe path in order to be accessed with the Merry Call() function. This is done with the set_object_name() function.
   2. The function we want accessible to Merry but must defined in the query_method() and call_method() functions in the library.
   
In order for LPC object data to be visible in Tree of Woe:
   1. The object must have a Tree of Woe path in order to be seen in Tree of Woe. This is done with the set_object_name() function.
   2. The object must have a state root definition in order to be assigned a SID object. This is done with the query_state_root() function.
   3. The SID must have a namespace (ns) and tag that matches the state root of the object in order to be linked. If the state root is "UserAPI:UDat" then the ns and tag must be "UserAPI" and "UDat" respectively.
   
See also: [Layers of the SkotOS Server](./../../../Maintainer/Layers.md) and [State Interface Definitions](./../../../Developer/SID.md).

