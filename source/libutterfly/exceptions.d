module libutterfly.exceptions;

/* TODO: Work in progress */
public class ButterflyException : Exception
{

    public string message;
    public long statusCode;

    this(string message, long statusCode)
    {
        super(message);
        this.message = message;
        this.statusCode = statusCode;
    }
}