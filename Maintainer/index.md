---
sort: 8
---
# Maintaining a SkotOS Game

This is documentation for administrators and maintainers &mdash; people who have to keep the game running day-to-day.

You can find useful things in other sections. You'll probably need to know a bit about being a [StoryBuilder](../Story_Builder/), for instance, and maybe [a bit about writing DGD code](../Developer/).

But you'll also need to know some more specific things ***just for you***, as a maintainer.

This is a grab-bag of documentation from commercial SkotOS games, including the ones still running.

It could use a proper reorganisation.

* [Maintenance](./Maintenance.md)
* [Healthy State](./Healthy_State.md) &mdash; what processes, listeners and crons should be running on a working production deploy
* [Diagnostics](./Diagnostics.md) &mdash; symptom-to-cause table and the diagnostic order for an outage
* [Inherited Deployment](./Inherited_Deployment.md) &mdash; taking over a SkotOS box that has not been touched in years
* [Authentication](./Authentication.md)
* [Users and Logins](./Users_and_Logins.md)
* [Layers of the SkotOS server](./Layers.md)
* [SkotOS Wiztool](../Developer/SkotOS_Wiztool.md)
* [Staff_Plus_Commands](../Story_Builder/Staff_Plus_Commands.md)

## Roles

MUDs have historically needed a bit more [hierarchy and management](../Basics/Roles.md) than you'd expect because they're normally run by volunteers, not by a small number of paid, dedicated employees. That means it's important to give out privileges carefully, and to know who does what.
