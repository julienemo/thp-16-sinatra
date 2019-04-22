A ruby-generated folder

-Julie Kwok @julienemo and Arthur Klein @arthurjacobklein

The Gossip Projet is a local-run site where you can post (in tourist mode), change, and see gossips about the community.

-home page: provides choices between either seeing all existing gossips or create new ones
(http://localhost:4567/)

-list page: displays all existing gossips with author avatars
can go back to homepage from there
(http://localhost:4567/gossips/all)

-creation page: creates one new gossip per submit and redirects to updated list
(http://localhost:4567/gossips/new)

-individual gossip page: displays only the one gossip on which user clicked. Provides possibility to change it. Anybody can change any existing gossip. Can go back either to homepage or list page.
It currently has a comment formula that DOESN'T work.
(http://localhost:4567/gossips/:id)

-editing page: collects the update by a formula. Redirects to the list page with updated gossips.
