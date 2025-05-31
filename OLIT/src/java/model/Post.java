/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Post {

    private int PostID;
    private int UserID;
    private int CategoryID;
    private String BlogTitle;
    private String PostDetails;
    private int Status;
    private String UpdatedDate;
    private String ThumbnailURL;

    public Post() {
    }

    public Post(int PostID, int UserID, int CategoryID, String BlogTitle, String PostDetails, int Status, String UpdatedDate, String ThumbnailURL) {
        this.PostID = PostID;
        this.UserID = UserID;
        this.CategoryID = CategoryID;
        this.BlogTitle = BlogTitle;
        this.PostDetails = PostDetails;
        this.Status = Status;
        this.UpdatedDate = UpdatedDate;
        this.ThumbnailURL = ThumbnailURL;
    }

    public int getPostID() {
        return PostID;
    }

    public void setPostID(int PostID) {
        this.PostID = PostID;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }

    public String getBlogTitle() {
        return BlogTitle;
    }

    public void setBlogTitle(String BlogTitle) {
        this.BlogTitle = BlogTitle;
    }

    public String getPostDetails() {
        return PostDetails;
    }

    public void setPostDetails(String PostDetails) {
        this.PostDetails = PostDetails;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int Status) {
        this.Status = Status;
    }

    public String getUpdatedDate() {
        return UpdatedDate;
    }

    public void setUpdatedDate(String UpdatedDate) {
        this.UpdatedDate = UpdatedDate;
    }

    public String getThumbnailURL() {
        return ThumbnailURL;
    }

    public void setThumbnailURL(String ThumbnailURL) {
        this.ThumbnailURL = ThumbnailURL;
    }

}
