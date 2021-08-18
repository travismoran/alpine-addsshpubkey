# Docker Image that can be launched using a scheduler like swarm/rancher/kubernetes to add an ssh key to all hosts matching the scheduler rules you define.

### required variables
#### sshuser - the user you wish to add the pub key to ~/.ssh/authorized_keys
#### sshpubkey - the ssh public key
```
sshuser: ubuntu
sshpubkey: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCX9t8xwgpuKkyi+9nrgRq295HAmEQHe3vJBTZSaX/D3a1BibfyNqjS3YFClgoC5DTu6+DJ+pI9IA3/TQp1SeYE6iCJSTnwPiWaoKs2f+ZUxVk+/uvz75sFfUFb2ndN5Qku41QXBy2z74pwSpqjJRq9A73/emrswQp8SB0n6mwbDv8ZZq36uE1BCSVqxRM1FQ0lqkXpim/qkFhgXk7BEXXIA8jauHnN4QFdkbhw2/Jg/Jkq+BY9NLOyG+7V5b3NP6bSLVc0RHr9eONnnycTp51eNzFg0TsX0imeHJhOgyG9jHSXRl5RhNmLMI5+sGqN/2O6u2KT+XRaJ0TSdJxm7tlD example-rsa-key-20210818
```

### Rancher 1.6 example
#### The below docker-compose.yml will launch the container on all hosts in an environment

```
version: '2'
services:
  getroot:
    image: public.ecr.aws/e0r8b4b0/stackgurus/alpine-addsshpubkey:latest
    environment:
      sshpubkey: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCX9t8xwgpuKkyi+9nrgRq295HAmEQHe3vJBTZSaX/D3a1BibfyNqjS3YFClgoC5DTu6+DJ+pI9IA3/TQp1SeYE6iCJSTnwPiWaoKs2f+ZUxVk+/uvz75sFfUFb2ndN5Qku41QXBy2z74pwSpqjJRq9A73/emrswQp8SB0n6mwbDv8ZZq36uE1BCSVqxRM1FQ0lqkXpim/qkFhgXk7BEXXIA8jauHnN4QFdkbhw2/Jg/Jkq+BY9NLOyG+7V5b3NP6bSLVc0RHr9eONnnycTp51eNzFg0TsX0imeHJhOgyG9jHSXRl5RhNmLMI5+sGqN/2O6u2KT+XRaJ0TSdJxm7tlD example-rsa-key-20210818 
      sshuser: root
    stdin_open: true
    volumes:
    - /root:/hostroot/root
    tty: true
    labels:
      io.rancher.scheduler.global: 'true'
      io.rancher.container.start_once: 'true'
```
