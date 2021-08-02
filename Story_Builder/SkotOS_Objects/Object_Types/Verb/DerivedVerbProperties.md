See DerivedProperties for an introduction on the basic concept of derived properties. This is just a reference table of the derived properties that are available for interrogation on social verbs.

The table is on precisely the same format as the one in DerivedProperties.

**First, per-verb properties:**

| Property name              | Access | Type          | Description |
|----------------------------|--------|---------------|-------------|
| verb:imperative            | RO     | string        | The imperative form of the verb, e.g. \'smile\' as in \'I command you to smile\' |
| verb:third                 | RO     | string        | The third person form of the verb, e.g. \'smiles\' as in \'He smiles.\'
| verb:evoke-allowed         | RO     | int           | If this flag is true, the user may supply an evoke, as in e.g. \'scream\'
| verb:evoke-required        | RO     | int           | If this flag is true, the user must supply an evoke, as in e.g. \'say\'
| verb:roles                 | RO     | string \*   &nbsp; | The role identifiers of the various objects the verb allows
| verb:privacy               | RO     | int           | If this flag is true, on-lookers do not see the action, used e.g. in \'whisper\'
| verb:log-evokes            | RO     | string        | If non-nil, using this verb with an evoke results in the evoke being logged under Admins.SkotOS:LogNodes, as with e.g. \'bug\' |
| verb:connects              | RO     | int           | If this flag is true and the action has a target and the target is an exit detail, the other side of the exit is informed about the action \-- used e.g. in \'knock\' |
|----------------------------|--------|---------------|-------------|

**Then, per-role properties:**

| Property name              | Access | Type          | Description |
|----------------------------|--------|---------------|-------------|
| verb:role:foo:allowed      | RO     | int           | If true, this verb may optionally take an object identified by role \'foo\' |
| verb:role:foo:required     | RO     | int           | If true, this verb always requires an object identified by role \'foo\' |
| verb:role:foo:far          | RO     | int           | If true, the object serving role \'foo\' may be acted upon without any proximity changes |
| verb:role:foo:armslength   | RO     | int           | If true, the object serving role \'foo\' may be acted upon with a shared parent prox |
| verb:role:foo:close        | RO     | int           | If true, the object serving role \'foo\' may be acted upon only in close, consent-requiring proximity |
| verb:role:foo:owned        | RO     | int           | If true, the object serving role \'foo\' must be held by the actor |
| verb:role:foo:prepositions | RO     | string \*   &nbsp; | The prepositions that determine the object serving role \'foo\' |
| verb:role:foo:direct       | RO     | int           | If true, the object serving role \'foo\' may appear without a preposition |
|----------------------------|--------|---------------|-------------|
