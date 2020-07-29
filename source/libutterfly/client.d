module libutterfly.client;

import std.socket;
import bmessage;
import std.json;
import libutterfly.exceptions : ButterflyException;

public final class ButterflyClient
{

    /**
    * Socket connection to the server
    */
    private Socket connection;

    /**
    * Creates a new ButterflyClient connected
    * to the butterfly server specified by the
    * Address `endpoint`.
    */
    this(Address endpoint)
    {
        /**
        * Connect to the remote server
        */
        connection = new Socket(AddressFamily.INET, SocketType.STREAM, ProtocolType.TCP);
        connection.connect(endpoint);
    }

    /**
    * Authenticate to the server with the given `username`
    * and `password`.
    *
    * Throws a ButterflyException if the authentication
    * details are incorrect.
    */
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
            /* Throw an exception */
            throw new ButterflyException(response["status"]["message"].str(), response["status"]["code"].integer());
        }
    }


    public string editMail(string mailPath, JSONValue messageBlock)
    {
        string mailID;


        /**
        * Construct the command.
        */
        JSONValue commandBlock;
        commandBlock["command"] = "editMail";
        
        JSONValue requestBlock;
        requestBlock["message"] = mailPath;
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
            /* Throw an exception */
            throw new ButterflyException(response["status"]["message"].str(), response["status"]["code"].integer());
        }


        return mailID;
    }


    /**
    * Send the provided JSONValue mail `messageBlock`
    *
    * Throws a ButterflyException if the mail sending
    * fails.
    */
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
            /* Throw an exception */
            throw new ButterflyException(response["status"]["message"].str(), response["status"]["code"].integer());
        }
    }

    /**
    * Returns a string[] of the folder names in the given
    * folder, `folderPath`
    *
    * Throws a ButterflyException if the lookup fails.
    */
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
            foreach(JSONValue folderName; response["response"]["folders"].array())
            {
                folderNames ~= folderName.str();
            }
            return folderNames;
        }
        else
        {
            /* Throw an exception */
            throw new ButterflyException(response["status"]["message"].str(), response["status"]["code"].integer());
        }
    }

    /**
    * Deletes an existing folder under the path specified
    * by `folderPath`.
    *
    * Throws a ButterflyException if the folder deletion
    * fails.
    */
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
            /* Throw an exception */
            throw new ButterflyException(response["status"]["message"].str(), response["status"]["code"].integer());
        }
    }

    /**
    * Creates a new folder under the path specified
    * by `folderPath`.
    *
    * Throws a ButterflyException if the folder creation
    * fails.
    */
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
            /* Throw an exception */
            throw new ButterflyException(response["status"]["message"].str(), response["status"]["code"].integer());
        }
    }

    /**
    * Returns a string[] of the mail IDs within the
    * given folder, `folderPath`.
    *
    * Throws a ButterflyException if the lookup fails.
    */
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
            foreach(JSONValue mailID; response["response"]["mailIDs"].array())
            {
                mailIDs ~= mailID.str();
            }
            return mailIDs;
        }
        else
        {
            /* Throw an exception */
            throw new ButterflyException(response["status"]["message"].str(), response["status"]["code"].integer());
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
            mailID = response["response"]["mailID"].str();
        }
        else
        {
            /* Throw an exception */
            throw new ButterflyException(response["status"]["message"].str(), response["status"]["code"].integer());
        }


        return mailID;
    }

    /**
    * Fetches the message block (mail message JSON) of the
    * mail message specified by `mailID` located in the
    * folder specified by `folderPath`. Returns it as a
    * JSONValue.
    *
    * Throws a ButterflyException if the mail fetch fails.
    */
    public JSONValue fetchMail(string folderPath, string mailID)
    {
        /**
        * Construct the command.
        */
        JSONValue commandBlock;
        commandBlock["command"] = "fetchMail";
        
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
            /* Throw an exception */
            throw new ButterflyException(response["status"]["message"].str(), response["status"]["code"].integer());
        }
    }

    /**
    * Registers a new account with the given `username`
    * and `password`.
    *
    * Throws a ButterflyException if the account creation
    * fails.
    */
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
            /* Throw an exception */
            throw new ButterflyException(response["status"]["message"].str(), response["status"]["code"].integer());
        }
    }
}
