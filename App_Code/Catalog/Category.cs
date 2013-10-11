using System;


///<summary>
/// Class Item
/// Represents a category of Items the small business uses to 
///classify/organize its Items 
/// </summary>
public class Category
{
    private string _id;
    private bool _visible;
    private string _title;
    private string _description;
    private string _functions;
    private string _imageUrl;
    private string _imageAltText;
    private string _videoUrl;
    private string _videoHeight;
    private string _videoWidth;
    private string _youTubeID;
          
    public Category(string id, bool visible, string title)
    {
        if (String.IsNullOrEmpty(id)) throw new ArgumentException(Messages.CategoryIdUndefined);
        if (String.IsNullOrEmpty(title)) throw new ArgumentException(Messages.CategoryTitleUndefined); 

        _id             = id;
        _visible        = visible;
        _title          = title;
    }


    public string Id
    {
        get { return _id; }
    }

    public string Title
    {
        get { return String.IsNullOrEmpty(_title) ? String.Empty : _title; }
        set 
        { 
            if (String.IsNullOrEmpty(value))
                throw new InvalidOperationException(Messages.ItemTitleIsNull);
            _title = value; 
        }
    }

    public bool Visible
    {
        get { return _visible; }
        set { _visible = value; }
    }

 
    public string Description
    {
        get { return String.IsNullOrEmpty(_description) ? String.Empty : _description; }
        set { _description = value; }
    }
    
    public string Functions
    {
        get { return String.IsNullOrEmpty(_functions) ? String.Empty : _functions; }
        set { _functions = value; }
    }

    public string ImageUrl
    {
        get { return String.IsNullOrEmpty(_imageUrl) ? String.Empty : _imageUrl; }
        set { _imageUrl= value; }
    }


    public string ImageAltText
    {
        get { return String.IsNullOrEmpty(_imageAltText) ? String.Empty : _imageAltText; }
        set { _imageAltText = value; }
    }

    
    public string VideoUrl
    {
        get { return String.IsNullOrEmpty(_videoUrl) ? String.Empty : _videoUrl; }
        set { _videoUrl = value; }
    }

    public string VideoHeight
    {
        get { return String.IsNullOrEmpty(_videoHeight) ? String.Empty : _videoHeight; }
        set { _videoHeight = value; }
    }
    public string VideoWidth
    {
        get { return String.IsNullOrEmpty(_videoWidth) ? String.Empty : _videoWidth; }
        set { _videoWidth = value; }
    }
    public string YouTubeID
    {
        get { return String.IsNullOrEmpty(_youTubeID) ? String.Empty : _youTubeID; }
        set { _youTubeID = value; }
    }
    
} // end class

