module libutterfly.client;

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

        if(response["status"]["code"].integer() == 0)
        {
            /* TODO: Good */
        }
        else
        {
            /* TODO: Throw an exception here */
        }
    }

    public void sendMail(JSONValue messageBlock)
    {
        /**
        * Construct the command.
        */
        JSONValue commandBlock;
        commandBlock["command"] = "sendMail";
        
        JSONValue requestBlock;
        requestBlock["mail"] = messageBlock;

        commandBlock["request"] = requestBlock;

        /* Send the command */
        sendMessage(connection, cast(byte[])toJSON(commandBlock));

        /* Get the status */
        JSONValue response;

        byte[] receivedBytes;
        receiveMessage(connection, receivedBytes);
        response = parseJSON(cast(string)receivedBytes);

        if(response["status"]["code"].integer() == 0)
        {
            /* TODO: Good */
        }
        else
        {
            /* TODO: Throw an exception here */
        }
    }

    public string[] listFolder(string folderPath)
    {
        /**
        * Construct the command.
        */
        JSONValue commandBlock;
        commandBlock["command"] = "listFolder";
        
        JSONValue requestBlock;
        requestBlock["folderName"] = folderPath;

        commandBlock["request"] = requestBlock;

        /* Send the command */
        sendMessage(connection, cast(byte[])toJSON(commandBlock));

        /* Get the status */
        JSONValue response;

        byte[] receivedBytes;
        receiveMessage(connection, receivedBytes);
        response = parseJSON(cast(string)receivedBytes);

        if(response["status"]["code"].integer() == 0)
        {
            /* TODO: Good */
            string[] folderNames;
            foreach(JSONValue folderName; response["folders"].array())
            {
                folderNames ~= folderName.str();
            }
            return folderNames;
        }
        else
        {
            /* TODO: Throw an exception here */
            return [];
        }
    }

    public void deleteFolder(string folderPath)
    {
        /**
        * Construct the command.
        */
        JSONValue commandBlock;
        commandBlock["command"] = "deleteFolder";
        
        JSONValue requestBlock;
        requestBlock["folderName"] = folderPath;

        commandBlock["request"] = requestBlock;

        /* Send the command */
        sendMessage(connection, cast(byte[])toJSON(commandBlock));

        /* Get the status */
        JSONValue response;

        byte[] receivedBytes;
        receiveMessage(connection, receivedBytes);
        response = parseJSON(cast(string)receivedBytes);

        if(response["status"]["code"].integer() == 0)
        {
            /* TODO: Good */
        }
        else
        {
            /* TODO: Throw an exception here */
        }
    }

    public void createFolder(string folderPath)
    {
        /**
        * Construct the command.
        */
        JSONValue commandBlock;
        commandBlock["command"] = "createFolder";
        
        JSONValue requestBlock;
        requestBlock["folderName"] = folderPath;

        commandBlock["request"] = requestBlock;

        /* Send the command */
        sendMessage(connection, cast(byte[])toJSON(commandBlock));

        /* Get the status */
        JSONValue response;

        byte[] receivedBytes;
        receiveMessage(connection, receivedBytes);
        response = parseJSON(cast(string)receivedBytes);

        if(response["status"]["code"].integer() == 0)
        {
            /* TODO: Good */
        }
        else
        {
            /* TODO: Throw an exception here */
        }
    }

    public string[] listMail(string folderPath)
    {
        /**
        * Construct the command.
        */
        JSONValue commandBlock;
        commandBlock["command"] = "listMail";
        
        JSONValue requestBlock;
        requestBlock["folderName"] = folderPath;

        commandBlock["request"] = requestBlock;

        /* Send the command */
        sendMessage(connection, cast(byte[])toJSON(commandBlock));

        /* Get the status */
        JSONValue response;

        byte[] receivedBytes;
        receiveMessage(connection, receivedBytes);
        response = parseJSON(cast(string)receivedBytes);

        if(response["status"]["code"].integer() == 0)
        {
            /* TODO: Good */
            string[] mailIDs;
            foreach(JSONValue mailID; response["mailIDs"].array())
            {
                mailIDs ~= mailID.str();
            }
            return mailIDs;
        }
        else
        {
            /* TODO: Throw an exception here */
            return [];
        }
    }

    public string storeMail(string folderPath, JSONValue messageBlock)
    {
        string mailID;


        /**
        * Construct the command.
        */
        JSONValue commandBlock;
        commandBlock["command"] = "storeMail";
        
        JSONValue requestBlock;
        requestBlock["folder"] = folderPath;
        requestBlock["mail"] = messageBlock;

        commandBlock["request"] = requestBlock;

        /* Send the command */
        sendMessage(connection, cast(byte[])toJSON(commandBlock));

        /* Get the status */
        JSONValue response;

        byte[] receivedBytes;
        receiveMessage(connection, receivedBytes);
        response = parseJSON(cast(string)receivedBytes);

        if(response["status"]["code"].integer() == 0)
        {
            /* TODO: Good */
        }
        else
        {
            /* TODO: Throw an exception here */
        }


        return mailID;
    }

    public JSONValue fetchMail(string folderPath, string mailID)
    {
        /**
        * Construct the command.
        */
        JSONValue commandBlock;
        commandBlock["command"] = "register";
        
        JSONValue requestBlock;
        requestBlock["folder"] = folderPath;
        requestBlock["id"] = mailID;

        commandBlock["request"] = requestBlock;

        /* Send the command */
        sendMessage(connection, cast(byte[])toJSON(commandBlock));

        /* Get the status */
        JSONValue response;

        byte[] receivedBytes;
        receiveMessage(connection, receivedBytes);
        response = parseJSON(cast(string)receivedBytes);

        if(response["status"]["code"].integer() == 0)
        {
            /* TODO: Good */
            return response["response"]["mail"];
        }
        else
        {
            /* TODO: Throw an exception here */
            return JSONValue();
        }
    }

    public void register(string username, string password)
    {
        /**
        * Construct the command.
        */
        JSONValue commandBlock;
        commandBlock["command"] = "register";
        
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

        if(response["status"]["code"].integer() == 0)
        {
            /* TODO: Good */
        }
        else
        {
            /* TODO: Throw an exception here */
        }
    }
}