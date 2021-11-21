# Introduction

Delivering media over QUIC has piqued interest among use-cases that span the streaming media and real-time media domains, as is evident from the discussions on the "moq@ietf.org" mailing list. Any solution that addresses these use-cases should take into account requirements from these domains.

draft-gruessing-moq-requirements-00.txt captures various usecases and IETF drafts the are currently active for delivering media over QUIC. This document considers its inputs from draft-gruessing-moq-requirements-00.txt as well as active discusisons on the "moq@ietf.org" mailing list with a scope to distil the high level requirements for use-cases/applications where a UDP based transport (like QUIC) is considered and has characteristics of real-time and streaming media flows. 

# Contributing

All significant discussion of development of this protocol is in the GitHub issue tracker at TODO.

# Terminology

*   Relay - a server in the cloud that can receive subscriptions and send data it receives in.
    publish to other endpoints that have subscribed to the data.
*   Sender/Publisher: An endpoint that sends data to a Relay.
*   Receiver/Subscribers: An endpoint that subscribes to data from Relay and receives data. Relays can act as
    subscribers to other relays.
*   Client: An endpoint that acts as a Publisher, Subscriber, or both.
*   Upstream: Sending data from Publisher to Relay
*   Downstream: Sending data from Relay to a Subscriber


# Use cases

Following lists a sampling of usecases that could be benefitted by the media delivery solution as part of the "media-over-quic" efforts

*   Live stream a football game on multiple devices and have the playout synchronized but also have the overall; latency be fairly low (sub seconds aprox 250 ms on same contient ) 

*   Live auctions.  

*   Gaming where all players need to see “moves” or “cards” at same time.  

*   Live Music with musicians all in same locations.  

*   Distributed band with interactive media session in parallel. 

*   Push to Talk Media for Fronline communicantions.

*   [ More to come here ?]


# Requirements

*   The solution SHALL deliver the media where playout can be synchronized within 50 ms.  

*   Various media qualities from extremely low bitrate audio to high-end video SHALL be supported.

*   The solution SHALL be extensibe in supporting various media types, such as audio, video, 3d models, volumetric video, light-fields, game moves and so on.

*   The solution SHALL be able to support highly scalable (streaming to millions of viewers) as well as 1:1 use-cases.

*   The soluton SHALL allow for leveraging on path caches like CDNs wherever applicable to improve the latency and bandwidth requirements.

*   The solution should work over UDP with servers / caches with public IP addresses.

*   The solution SHALL support for multiple media encodings and ability for clients to select the appropriate encoding . Layered encodings (dependent) and simulcast (independent) encodings shall be supported.  

*   The solution SHALL provides at least the circuit break level for the congestion control. It shall provide information for encodor rate adaptation in senders. 

*   The soution SHALL support the plug-in ability for new congestion control algorithms.

*   The solution SHALL provide End-to-End encryption and confidentiality of the media data, possibly keyable with MLS.

*   The solution shall enable plug in and negotiable error recovery/correction per hop.

*   The solution shall enable the API to provide hints about the relative importance, reliability and latency characteristics for the various media flows.

*   The solution shall enable cloud first deployments - cloud friendly, horizontally scalable and highly available as with a typical modern cloud application.

*   The solution shall support a relay to move senders and receivers to talk to different relay (like HTTP redirect) to enable things like moving traffic between relays, say due to relay shutdown or as instructed by a load balancer.

*   The solution should enable easy to use developer API.

*   The solution shall enable an easy way to map the constructs to last mile streaming models like HLS/DASH.

*   The solution shall enable mapping to real-time point to point media constructs in the likes SIP/WebRTC.  

* [ More to come here ??]


