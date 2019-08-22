# Reverse-SSH-RPi
Guide to access your Raspberry Pi from anywhere through GCP VM instance

## Manual Setup

### Pre-Requisites

Before moving on make sure you have:

* a working Google Cloud Platform (GCP) account.

* a working VM Instance. If not, click [HERE](https://cloud.google.com/compute/docs/instances/create-start-instance) to see how to create a GCP VM instance.

* a working connection to the server (VM instance) using SSH. If not, click [HERE](https://docs.bitnami.com/google/faq/get-started/connect-ssh/) to see how to connect to the server using SSH.

### Clone Reverse-SSH-RPi

* Inside your Raspberry Pi, run these commands to download the Reverse-SSH-Rpi to your Pi:

  * `cd ~/`
  
  * `git clone https://github.com/Shubhankt1/Reverse-SSH-RPi.git`
  
  * `cd ~/Reverse-SSH-RPi`

### Start the tunnel

* Simply run the __rev_ssh_tunnel.sh__ script with External-IP address of your VM instance as the argument.

  (__NOTE:__ you can find the external-IP of your vm on the __VM Instance__ (Compute Engine > VM Instance) page on your GCP console)

  * For example: `./rev_ssh_tunnel.sh 192.168.1.100`

  #### Verify
  
  * In your terminal, run `/bin/pidof ssh`. If the tunnel is up & running, you'll get the ProcessID (pid) of the reverse-SSH tunnel, otherwise there will be no output.

### Stop the tunnel

* Simply run the __close_rev_ssh_tunnel.sh__ script to close the reverse-SSH tunnel running in the background.

  #### Verify
  
  * In your terminal, run `/bin/pidof ssh`. If the tunnel is closed, you'll get no output on the screen, otherwise the ProcessID (pid) of the reverse-SSH tunnel will be given as output.

### Connect to Pi

  * SSH into the server (VM instance) from your (allowed) host(s)/machine.
  
  * run `ssh <username>@localhost -p <PORT>`. (read about Important Commands at the end of the README)

## Important Commands

  ### Reverse-SSH command
  * `ssh -fN -R <PORT>:localhost:22 <username>@<server>`

    The Pi is ssh’ing to the server at `<server>` using the username `<username>`. Upon doing so, it’s telling that server to open port `<PORT>`. Any connections coming into the server on port `<PORT>` forward them over the tunnel back to the Pi on port 22.
  
    where,
    
    * -f: Fork in the background.
    
    * -N: No need to actually send any SSH commands once connected.
    
    * <PORT>: Any open/available port on your server machine.
  
  
