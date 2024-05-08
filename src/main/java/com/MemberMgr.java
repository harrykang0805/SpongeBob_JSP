package com;
import com.bean.MemberBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberMgr {
    Connection con=null;
    PreparedStatement pstmt;
    ResultSet rs;

    //싱글톤 패턴 적용
    private static MemberMgr instance = new MemberMgr();

    public static MemberMgr getInstance() {
        return instance;
    }

    // 요거슨 입력된 id, pwd 가 테이블에서 찾아서 일치하면 boolean값 리턴
    public boolean isMember(String  id, String pwd) {
        boolean result= false;
        DBConnection dbcon = DBConnection.getInstance();

        try {
            con = dbcon.getConnection();
            String sql = "select * from member where id = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                if(rs.getString("pwd").equals(pwd)) {
                    result = true;
                } else {
                    result = false;
                }
            }
            rs.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    // 요거슨 입력된 MemberBean으로 테이블에 저장
    public void insertMember(MemberBean input) {
        DBConnection dbcon = DBConnection.getInstance();
        try {
            con = dbcon.getConnection();
            String sql = "insert into member values(?,?,?,?,?,?,?,?,?,?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, input.getId());
            pstmt.setString(2, input.getPwd());
            pstmt.setString(3, input.getName());
            pstmt.setString(4, input.getGender()+"");
            pstmt.setString(5, input.getEmail());
            pstmt.setString(6, input.getBirth());
            pstmt.setString(7, input.getZipcode());
            pstmt.setString(8, input.getAddress());
            pstmt.setString(9, input.getHobby());
            pstmt.setString(10, input.getJob());
            pstmt.executeUpdate();

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 요거슨 입력된 Id가 중복확인인지 체크
    public boolean isDuplicatedId(String id) {
        boolean result= false;
        DBConnection dbcon = DBConnection.getInstance();

        try {
            con = dbcon.getConnection();
            String sql = "select id from member where id = ?";
            pstmt= con.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if(rs.next()) {
                result = true;
            }

            rs.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    public MemberBean getMember(String id) {
        MemberBean member = null;
        DBConnection dbcon = DBConnection.getInstance();

        try {
            con = dbcon.getConnection();
            String sql = "SELECT * FROM member WHERE id = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                member = new MemberBean();
                member.setId(rs.getString("id"));
                member.setPwd(rs.getString("pwd"));
                member.setName(rs.getString("name"));
                member.setGender(rs.getString("gender").charAt(0));
                member.setEmail(rs.getString("email"));
                member.setBirth(rs.getString("birth"));
                member.setZipcode(rs.getString("zipcode"));
                member.setAddress(rs.getString("address"));
                member.setHobby(rs.getString("hobby"));
                member.setJob(rs.getString("job"));
            }
        } catch (SQLException e) {
            e.printStackTrace(); // 적절한 예외 처리 로직으로 대체해야 합니다.
        } finally {
            closeResources(rs, pstmt, con);
        }

        return member;
    }

    // 자원 반납 메소드
    private void closeResources(ResultSet rs, PreparedStatement pstmt, Connection con) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace(); // 적절한 예외 처리 로직으로 대체해야 합니다.
        }
    }
}