For this helpers to work, first thing that must be done is to add this into the firewall rules file (`/etc/pf.conf`):

```
dummynet-anchor "bandwidthLimitingStuff"
anchor "bandwidthLimitingStuff"
```

Than all traffic shaping wil be done in that anchor. Long story short, an anchor is a way to tell the firewall to
reset and work only with that section. Without anchors, all the firewall is reset and re-written.

After the file was edited, restart is required. When that is done, scripts can be used to adjust that anchor in
firewall and traffic shapping can happen :)


