module source.libutterfly;

import std.socket;
import bmessage;
import std.json;

public final class ButterflyClient
{

    /**
    * Socket connection to the server
    */
    private Socket connection;

    this(Address endpoint)
    {
        /**
        * Connect to the remote server
        */
        connection = new Socket(AddressFamily.INET, SocketType.STREAM, ProtocolType.TCP);
        connection.connect(endpoint);
    }

    public void authenticate(string username, string password)
    {
        /**
        * Construct the command.
        */
        JSONValue commandBlock;
        commandBlock["command"] = "authenticate";
        
        JSONValue requestBlock;
        requestBlock["username"] = username;
        requestBlock["password"] = password;

        commandBlock["request"] = requestBlock;

        /* Send the command */
        sendMessage(connection, cast(byte[])toJSON(commandBlock));

        /* Get the status */
        JSONValue response;

        byte[] receivedBytes;
        receiveMessage(connection, receivedBytes);
        response = parseJSON(cast(string)receivedBytes);

        if(response["status"].integer() == 0)
        {
            /* TODO: Good */
        }
        else
        {
            /* TODO: Throw an exception here */
        }
    }
}