## Prerequisites

Note:

[A Zigbee Adapter](https://www.zigbee2mqtt.io/guide/adapters/) is needed, e.g. a CC2652 USB Stick.

The Zigbee2MQTT frontend will not start, if the Adapter can't be accessed!
In this case you can see output in the logs like:

```
Zigbee2MQTT:error: Error while starting zigbee-herdsman
Zigbee2MQTT:error: Failed to start zigbee
Zigbee2MQTT:error: Check https://www.zigbee2mqtt.io/guide/installation/20_zigbee2mqtt-fails-to-start.html for possible solutions
Zigbee2MQTT:error: Exiting...
```

### put the correct port in configuration

See also: https://www.zigbee2mqtt.io/guide/installation/20_zigbee2mqtt-fails-to-start.html


## Setup

After install the YunoHost package, go to Zigbee2MQTT frontend and change at lease:

* Under `Settings / MQTT`:
  * `MQTT server` e.g.: `mqtt://exmaple.tld:1883`
  * Maybe: MQTT server username and password
* Under `Settings / Serial`:
  * Your USB device, e.g.: `/dev/ttyACM0` or better a `/dev/serial/by-id/...` path!
  * See: https://www.zigbee2mqtt.io/guide/installation/01_linux.html#determine-location-of-the-adapter-and-checking-user-permissions

## debug installation

Some commands to debug the installation:

```bash
systemctl status zigbee2mqtt.service
systemctl restart zigbee2mqtt.service
journalctl -u zigbee2mqtt.service -f
```
