<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- boardPlayView  놀이터 작성글 보는 페이지-->

<body>
  <div class="section">
    <div class="container">

      <!--  <article class="mb-4">-->
      <div class="container px-4 px-lg-5">
      
        <div class="row gx-4 gx-lg-5 justify-content-center">
		<div class="writer-box">
          <div class="col-md-10 col-lg-8 col-xl-7">
            <p>작성자&nbsp;|&nbsp;&nbsp;<a>${vo.memberId }</a></p>
            <p>작성일&nbsp;|&nbsp;
              <a>
                <fmt:formatDate value="${vo.boardJoindate }" pattern="yyyy-MM-dd HH:mm:ss" /></a></p>
            <p>조회수 ${vo.boardCount }</p>
            <hr></hr>
            <p><a>제목&nbsp;|&nbsp;${vo.boardTitle }</a></p>
            <p><span class="caption text-muted">
                ${vo.boardContent } </span></p>
            <p></p>
            
			 </div>
				
			
            <table><div class = "moddelB" float:left;>
              <tr>
                <td colspan="3" align="center">
                  <button id="modBtn">수정</button>
                  <button id="delBtn">삭제</button>
                </td>
              </tr>
         	</div></table>
		
			
            <form id="myFrm" action="boardPlayUpdateForm.do">
              <input type="hidden" name="boardNum" value="${vo.boardNum }">
            </form>

            <script>
              //수정.
              document.querySelector('#modBtn').addEventListener('click', function (e) {
                e.preventDefault();
                let myFrm = document.querySelector('#myFrm');
                myFrm.submit();
              });

              // 삭제.
              document.querySelector('#delBtn').addEventListener('click', function () {
                let myFrm = document.querySelector('#myFrm');
                // FrontController에 NoticeRemoveControl();
                // 서비스 : noticeRemove(int nid), mapper: deleteNotice(int nid);
                myFrm.action = 'boardPlayRemove.do'; // myFrm.setAttribute('action', 'noticeRemove.do')
                myFrm.append(document.querySelector('input[name="nid"]'));
                myFrm.submit();
              })
            </script>

            <!--참고: https://cameldev.tistory.com/63 댓글코멘트창 -->

            <!-- 댓글등록창 -->
            <form class="form-horizontal" action="addComment.do">

              <hr>
              <h3>Comments:</h3>
              <div class="card-body">
                <input type="hidden" name="boardNum" value="${vo.boardNum }">
                <div class="row">
                  <div class="form-group col-sm-8">
                    <input class="form-control input-sm" name="comment" id="newReplyText" type="text"
                      placeholder="댓글 입력...">
                  </div>
                  <div class="form-group col-sm-2">
                    <input class="form-control input-sm" name="writerId" id="newReplyWriter" type="text"
                      placeholder="작성자" value="${logId }">
                  </div>
                  <div class="form-group col-sm-2">
                    <button type="submit" class="btn btn-primary btn-sm btn-block replyAddBtn">
                      <i class="fa fa-save"></i> 등록
                    </button>
                  </div>
                </div>
            </form>
          </div>



          <!--  댓글 보이는창 -->
          <div class="card-body repliesDiv">
            <table>
              <thead>
                <tr>
                  <th>내용</th>
                  <th>작성자</th>
                  <th>등록일</th>
                  <th>수정</th>
                  <th>삭제</th>
                </tr>
              </thead>
              
              <tbody id="list">
                <c:forEach var="cvo" items="${list}">
                  <tr data-id="${cvo.commentNum }">
                    <td>${cvo.commentContent }</td>
                    <td>${cvo.replyId }/ ${cvo.commentNum }</td>
                    <td>
                      <fmt:formatDate value="${cvo.commentJoindate }" pattern="yyyy-MM-dd HH:mm:ss" />
                    </td>
                    <td><button class="commentMod">댓글수정</button></td>
                    <td><button class="commentDel">댓글삭제</button></td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>

          <form id="commentFrm" action="modifyComment.do">
            <input type="hidden" name="commentNum">
            <input type="hidden" name="commentContent">
          </form>

          <div style="display: none">
            <table>
              <tr id="template">
                <td><input type="text" value="sample comment"></td>
                <td>user01</td>
                <td>
                  <fmt:formatDate value="" pattern="yyyy-MM-dd HH:mm:ss" />
                </td>
                <td><button data-id="40" onclick="saveComment(event)">저장</button></td>
                <td><button class="commentDel">댓글삭제</button></td>
              </tr>
            </table>
          </div>

          <script>
            document.querySelectorAll('.commentMod').forEach(function (btn) {
              //console.log(btn);
              btn.addEventListener('click', function (e) {
                console.log(btn.parentElement.parentElement.getAttribute('data-id'))
                let oldTr = btn.parentElement.parentElement;
                let cNum = btn.parentElement.parentElement.getAttribute('data-id');

                fetch('getCommentJson.do?cNum=' + cNum)
                  .then(resolve => resolve.json())
                  .then(result => {
                    console.log(result);
                    let cloneTr = document.querySelector('#template').cloneNode(true);
                    cloneTr.querySelector('input').value = result.commentContent;
                    cloneTr.querySelector('td:nth-of-type(2)').innerText = result.replyId;
                    cloneTr.querySelector('button:nth-of-type(1)').setAttribute('data-id', result.commentNum)
                    //cloneTr.querySelector('fmt').value = result.commentJoindate;
                    console.log(cloneTr)
                    // document.querySelector('#list').append(cloneTr);
                    oldTr.parentElement.replaceChild(cloneTr, oldTr);
                  })
                  .catch(reject => console.log(reject))
              });
            });

            function saveComment(e) {
              console.log(e.target.getAttribute('data-id'))
              let cNo = e.target.getAttribute('data-id');
              let comment = e.target.parentElement.parentElement.firstElementChild.firstElementChild.value;
              console.log(cNo, comment);
              fetch('modifyComment.do?cNo=' + cNo + '&comment=' + comment)
                .then(resolve => resolve.json())
                .then(result => console.log(result))
                .catch(reject => console.log(reject))
            }
          </script>
          <!--  <script>
            //수정.
              document.querySelector('#modBtn2').addEventListener('click', function (e) {
                e.preventDefault();
                let myFrm = document.querySelector('#myFrm2');
                myFrm.submit();
              });
             
            </script>-->

          <!--<%--댓글 페이징--%>
              <div class="card-footer">
                <nav aria-label="Contacts Page Navigation">
                  <ul class="pagination pagination-sm no-margin justify-content-center m-0">

                  </ul>
                </nav>
              </div>
            </div>-->

          </p>
         
        </div>
      </div>
    </div>
    <!--  </article> -->
  </div>


  </div>
  </div>

</body>