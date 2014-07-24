Ansible Workshop by BigPanda
============================

All the resources required for the Ansible workshop organized by BigPanda

The workshop is divided into 9 subsequent chapters, where (most of the time) the work on each chapter actually leads to the beginning of the next chapter.
Jumping between chapters is easy and done using Git mechanics:

* Chapter 1 - Basic Setup: `git checkout 01-basic-setup`
* Chapter 2 - My First Playbook: `git checkout 02-my-first-playbook`
* Chapter 3 - Nginx: `git checkout 03-nginx`
* Chapter 4 - Handlers: `git checkout 04-handlers`
* Chapter 5 - Application Deployments: `git checkout 05-app-deployments`
* Chapter 6 - Roles: `git checkout 06-roles`
* Chapter 7 - Role Dependencies: `git checkout 07-roles-dep`
* Chapter 8 - Advanced Inventory: `git checkout 08-inventory`
* Chapter 9 - Variable Precedence: `git checkout 09-precedence`

**Note**: You can't move to the next chapter if you did any local changes until you reset the Git repository. To do that simply execute `git reset --hard`

<pre>


               ..,:::,,,:::,..                ...,::,,,,::,...
            .,:.             .,,.          ..:.              .:..
         .,,    ,8MMMMMMMMMN,    ,,.     .:.    IMMMMMMMMMMI     :.
       .,,   +MMMMMMMMMMMMMMMMM$   :.. .:    MMMMMMMMMMMMMMMMMM    :.
      .:   IMMMMMMMMMMMMMMMMMMMMM+  .,.,   MMMMMMMMMMMMMMMMMMMMMM   ...
     .,  .MMMMMMMMMMMMMMMMMMMMMMMMM   .  ZMMMMMMMMMMMMMMMMMMMMMMMMM   :.
    .:  DMMMMMMMMMMMMMMMMMMMMMMMMMMM.   NMMMMMMMMMMMMMMMMMMMMMMMMMMM.  ,
   .:  7MMMMMMMMMMMMMMMMMMMMMMMMMMMMM  8MMMMMMMMMMMMMMMMMMMMMMMMMMMMM  .,
   .  =MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM$MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM  :.
  .:  MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM? ..
  .,  MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM  ,
  .. ?MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM  :.
  ,. DMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM  :.
  ,  MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM  7MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM  ,.
  ,  MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM  ,.
  ,. DMMMMMMMMMMMMMMMMMMMMMMMMMMMMMD     MMMMMMMMMMMMMMMMMMMMMMMMMMMMMM  :.
  .. IMMMMMMMMMMMMMMMMMMMMMMMMMMMMM   ?  ZMMMMMMMMMMMMMMMMMMMMMMMMMMMMM  :.
  .,  MMMMMMMMMMMMMMMMMMMMMMMMMMMM   MM   MMMMMMMMMMMMMMMMMMMMMMMMMMMMM  ,
  .:  MMMMMMMMMMMMMMMMMMMMMMMMMMMM  ?MMM   MMMMMMMMMMMMMMMMMMMMMMMMMMM? ..
   .  ~MMMMMMMMMMMMMMMMMMMMMMMMMM   MMMMO  DMMMMMMMMMMMMMMMMMMMMMMMMMM  :.
   .:  8MMMMMMMMMMMMMMMMMMMMMMMM.  ~MMMMM   MMMMMMMMMMMMMMMMMMMMMMMMM  ..
    .,  MMMMMMMMMMMMMMMMMMMMMMMM     7MMMM   MMMMMMMMMMMMMMMMMMMMMMM=  ,
     ..  MMMMMMMMMMMMMMMMMMMMMM   M~   ?MM?  MMMMMMMMMMMMMMMMMMMMMM,  :.
      ,.  MMMMMMMMMMMMMMMMMMMM,  ?MMM    8M   MMMMMMMMMMMMMMMMMMMM~  :.
       ..  IMMMMMMMMMMMMMMMMMM   MMMMMM.   $  .MMMMMMMMMMMMMMMMMM   :.
        .:   MMMMMMMMMMMMMMMM   MMMMMMMMM      MMMMMMMMMMMMMMMM=  .,.
         .:   $MMMMMMMMMMMMM~  .MMMMMMMMMMM     MMMMMMMMMMMMMM   ,.
          ..,   NMMMMMMMMMMM   MMMMMMMMMMMMMM   MMMMMMMMMMMM.  .,.
            ...   MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.  .:.
              .,.   MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM~   :.
                .,.   MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.   :..
                  .,.   NMMMMMMMMMMMMMMMMMMMMMMMMMMM   .:..
                    .:.   MMMMMMMMMMMMMMMMMMMMMMMM   .:.
                      .,.   DMMMMMMMMMMMMMMMMMMM   .:.
                        .,,   8MMMMMMMMMMMMMMM.  .:.
                          .,.   MMMMMMMMMMMM7   :.
                            .,.   MMMMMMMMN   :.
                              .:   ZMMMMM   .,.
                                .,  ,MM7   :.
                                 .:      :.
                                  .,.  .:.
                                     ..

</pre>