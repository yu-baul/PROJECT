package com.koreait.pro.dto;

import java.sql.Date;

public class NoticeDTO {
   
   private int n_No, m_No;
   private String n_Title, n_Content;
   private Date n_Date;
   
   public NoticeDTO() {}

   public NoticeDTO(int n_No, int m_No, String n_Title, String n_Content, Date n_Date) {
      super();
      this.n_No = n_No;
      this.m_No = m_No;
      this.n_Title = n_Title;
      this.n_Content = n_Content;
      this.n_Date = n_Date;
   }

   public int getN_No() {
      return n_No;
   }

   public void setN_No(int n_No) {
      this.n_No = n_No;
   }

   public int getM_No() {
      return m_No;
   }

   public void setM_No(int m_No) {
      this.m_No = m_No;
   }

   public String getN_Title() {
      return n_Title;
   }

   public void setN_Title(String n_Title) {
      this.n_Title = n_Title;
   }

   public String getN_Content() {
      return n_Content;
   }

   public void setN_Content(String n_Content) {
      this.n_Content = n_Content;
   }

   public Date getN_Date() {
      return n_Date;
   }

   public void setN_Date(Date n_Date) {
      this.n_Date = n_Date;
   }
   

}