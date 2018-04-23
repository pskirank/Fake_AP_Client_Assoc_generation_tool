# Fake_AP_Client_Assoc_generation_tool
This creates fake APs, Clients and associations - Clients keep changing thier associations at user defined intervals. 
Also APs keep changing channels in the user defined intervals.
It works with adaptors supporting Atheros prism header drivers along with linux distribution such as Backtrack, Kali. Also works fine with 
It Needs a PCMCIA card which can make use of atheros old drivers mentoned above. 
Packets will be injected in legacy 802.11abg rates only.
Main use of this tool is to generate wifi load in the vicinity of a WiFi AP which has background scanning capability or a dedicated Wifi sensor device.
Mainly used in the stress tests / soak tests of WiFi security devices / softwares.
