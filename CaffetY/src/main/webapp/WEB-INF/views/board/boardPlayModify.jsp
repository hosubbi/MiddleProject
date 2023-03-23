<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- boardPlayView  놀이터 작성글 수정하는 페이지-->


<div class="section">
  <div class="container">
	
    <!--  <article class="mb-4"> -->
    <div class="container px-4 px-lg-5">
      <div class="row gx-4 gx-lg-5 justify-content-center">

        <div class="col-md-10 col-lg-8 col-xl-7">
          <form id="myFrm" action="boardPlayUpdate.do">
            <input type="hidden" name="boardNum" value="${vo.boardNum }">
            <p>
              작성자&nbsp;
              <a>${vo.memberId }</a>
              <p></p>
              작성일&nbsp;
              <a>
                <fmt:formatDate value="${vo.boardJoindate }" pattern="yyyy-MM-dd HH:mm:ss" /></a>
              <p></p>
              <a>제목&nbsp;<input type="text" name="boardTitle" value="${vo.boardTitle }"></a>
            </p>
            <img class="img-fluid" src="webapp/img/${vo.boardimgName }.jpg" alt="하얀강아지사진" />
            <p><span class="caption text-muted">
                <input type="text" name="boardContent" value="${vo.boardContent }"></span></p>
            <p></p>
            <p>조회수 ${vo.boardCount }</p>

            <table>
              <tr>
                <td colspan="3" align="center">
                  <button id="modBtn">저장</button>
                  <button id="delBtn">삭제</button>
                </td>
              </tr>
            </table>


          </form>

          <script>
            // 삭제.
            document.querySelector('#delBtn').addEventListener('click', function () {

              let myFrm = document.querySelector('#myFrm');
              // FrontController에 NoticeRemoveControl();
              // 서비스 : noticeRemove(int nid), mapper: deleteNotice(int nid);
              myFrm.action = 'noticeRemove.do'; // myFrm.setAttribute('action', 'noticeRemove.do')
              myFrm.append(document.querySelector('input[name="nid"]'));
              myFrm.submit();
            })
          </script>

          <!--참고: https://cameldev.tistory.com/63 댓글코멘트창 -->
          <!-- 댓글등록창 
          <h3>Comments:</h3>
          <hr>
          <hr />
          <div class="card-body">
            <form class="form-horizontal">
              <div class="row">
                <div class="form-group col-sm-8">
                  <input class="form-control input-sm" id="newReplyText" type="text" placeholder="댓글 입력...">
                </div>
                <div class="form-group col-sm-2">
                  <input class="form-control input-sm" id="newReplyWriter" type="text" placeholder="작성자">
                </div>
                <div class="form-group col-sm-2">
                  <button type="button" class="btn btn-primary btn-sm btn-block replyAddBtn">
                    <i class="fa fa-save"></i> 등록
                  </button>
                </div>
              </div>
            </form>
          </div>
-->

          <!-- 댓글 보이는창
	<div class="card card-primary card-outline">
  <%--댓글 유무 / 댓글 갯수 / 댓글 펼치기, 접기--%>
  <div class="card-header">
  <a href="" class="link-black text-lg"><i class="fas fa-comments margin-r-5 replyCount"></i></a>
    <div class="card-tools">
      <button type="button" class="btn primary"  data-widget="collapse">
          <i class="fa fa-plus"></i>
      </button>
    </div>
  </div>
  <%--댓글 목록--%>
  <div class="card-body repliesDiv">
  
  </div>
  <%--댓글 페이징--%>
  <div class="card-footer">
    <nav aria-label="Contacts Page Navigation">
    <ul class="pagination pagination-sm no-margin justify-content-center m-0">

    </ul>
    </nav>
  </div>
</div>
                        
  -->
        </div>
      </div>
    </div>
    <!-- </article> -->
  </div>

</div>