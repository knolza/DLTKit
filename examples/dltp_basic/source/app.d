import dltkit.core.net;
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