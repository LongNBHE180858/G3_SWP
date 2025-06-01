package dao;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Post;
import model.PostCategory;

/**
 *
 * @author Khai
 */
public class PostDAO extends DBContext {

    public List<Post> getAllBlog() {
        List<Post> listBlog = new ArrayList<>();
        String sql = "SELECT * FROM Post";

        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Post post = new Post();
                post.setPostID(rs.getInt("postID"));
                post.setUserID(rs.getInt("userID"));
                post.setCategoryID(rs.getInt("categoryID"));
                post.setBlogTitle(rs.getString("blogTitle"));
                post.setPostDetails(rs.getString("postDetails"));
                post.setStatus(rs.getInt("status"));
                post.setUpdatedDate(rs.getString("updatedDate")); // hoặc getDate nếu dùng kiểu Date
                post.setThumbnailURL(rs.getString("thumbnailURL"));

                listBlog.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace(); // nên in log lỗi ra console để debug
        }

        return listBlog;
    }
    
    public static void main(String[] args) {
        PostDAO postDAO = new PostDAO();
        List<Post> blogs = postDAO.getAllBlog();

        for (Post post : blogs) {
            System.out.println(post);
        }
    }

}
