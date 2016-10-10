/**
Title: peer is p2p peer connection module.
Copyright: Knolza Inc. 2016
License:   MIT
Authors:   Yezune Choi


DLTP(Distributed Ledger Transfer Protocol)

1.Peer discovery
2.Connecting To Peers
3.Initial Block Download
4.Block Broadcasting
5.Transaction Broadcasting
6.Misbehaving Nodes
7.Alerts

- 
Synopsis:
----
import dltkit.p2p.peer;

void handleRequest(scope DLTPeerRequest req, scope DLTPeerResponse res)
{
	if (req.path == "/")
		res.writeBody("Hello, World!", "text/plain");
}

shared static this()
{
	auto settings = new DLTPeerSettings;
	settings.port = 8080;
	settings.bindAddresses = ["::1", "127.0.0.1"];

	listenDLTP(settings, &handleRequest);
}
----

*/
module dltkit.p2p.peer;

import dltkit.core.net;

class DLTPeerRequest {

	string path = "/";
}

class DLTPeerResponse 
{
public:
	void writeBody(string message, string mime)
	{

	}
}

struct DLTPeerListener {

}

final class DLTPeerSettings {
	/** The port on which the DLTP peer is listening.

		the default value is 9090.
	*/
	ushort port = 9090;
	/** The interface on which the DLTP peer is listening.
		by default, the peer will listen on all IPv4 an IPv6 interfaces.
	*/
	string[] bindAddresses = ["::", "0.0.0.0"];

	/** Determines the server host name.

	*/
	string peerName;

}

DLTPeerListener listenDLTP(DLTPeerSettings settings, DLTPeerRequestDelegate request_handler)
{
	DLTPeerListener listener ;
	return listener;
}

DLTPeerListener listenDLTP(DLTPeerSettings settings, DLTPeerRequestFunction request_handler)
{
	DLTPeerListener listener ;
	return listener;
}	

/// Delegate based request handler
alias DLTPeerRequestDelegate = void delegate(DLTPeerRequest req, DLTPeerResponse res);
/// Static function based request handler
alias DLTPeerRequestFunction = void function(DLTPeerRequest req, DLTPeerResponse res);

/// Interface for class based request handlers
interface DLTPeerRequestHandler {
	/// Handles incoming DLTP requests
	void handleRequest(DLTPeerRequest req, DLTPeerResponse res);
}



