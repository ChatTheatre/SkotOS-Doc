## Adding Views From One Room To Another

The ability to add the view of one room from another is relatively easy.
Where this might be applicable: 
* In an open area (meadow, field, etc) you want a character to see the adjacent areas 
* Roads or hallways, being able to look further down in any direction 
* Rooms with windows giving the character the ability to see what is actually outside the window.

The first option is to add view details to your room object in WOE. An example of this might be


    DETAIL [view-bedroom]
    Brief: view of the bedroom
    Look: The bedroom is small and furnished with a small bed.

    SName: view
    PName: views
    Adjective: bedroom


The advantage to this method is that if a character types look at view
in any given room, they can easily see if there is a view and which
views there are. The disadvantage is that you have added work in
desribing all these views.

A simpler method would be to add a tag into the room object\'s details
that automatically emit the description of another coded room. An
example would be:


    DETAIL [window] 
    Brief: picture window
    Look: A window on the north side of the room overlooking Main Street.
    Examine: A window on the north side of the room overlooking Main Street. You can see <describe-view type="examine" view="OBJ(ABN:rooms:Arkham:streets:MainBoundary)"/> 

    SName: window
    PName: windows 
    Adjective: picture


In the above example, the first bit is describe-view, which is just
that, you\'re adding in the description of the view. The second is type;
do you want the look or examine of that room to be displayed. Here we
have the examine that will be shown. The last part is which room you
want the view of, in this case it is
ABN:rooms:Arkham:streets:MainBoundary.

This tag can be used in either look or examines. The advantage is that
you need only use a simple script to call up full descriptions of views.
The disadvantage is that you can only call up views of rooms that have
been coded.
