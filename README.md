## Ansible IL - Hands on workshop for Beginners

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

Prerequisites:

- [Vagrant](https://www.vagrantup.com/downloads.html)  
  If you're coming to the meetup, speed things up by running this before you come:

  ```
  vagrant box add 'ubuntu/trusty64' https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box
  ```

- [Ansible](http://docs.ansible.com/intro_installation.html) 

  ```
  (sudo) pip install ansible
  ```

- Then:

  ```
  git clone -b noob-workshop https://github.com/bigpandaio/ansible-workshop
  cd ansible-workshop
  vagrant up
  cp ansible/hosts{.template,}
  ```

  run `vagrant ssh-config` and use the values from the output to replace the `<PLACEHOLDERS>` in `ansible/hosts`

  Then, to check that it works:

  ```
  ansible all -m ping
  ```

## Now what?

See the `workshop` directory, you'll find a series of markdown steps that we'll be going through at the workshop, let's start with [step 0](./workshop/0_AdHoc-Commands.md)


*Enjoy!*
