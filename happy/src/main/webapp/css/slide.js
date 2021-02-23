$(document).ready(function(){
 
  $(".slide_div2").hide();
  $("input[name=open]").change(function() {

			var radioValue = $(this).val();

			if (radioValue == "1") {
        $(".slide_div").show();
        $(".slide_div2").hide();

			} else if (radioValue == "2") {

        $(".slide_div").hide();
        $(".slide_div2").show();
      }



		});

   });
   
        function answer_check(a,b,c){
          if(a==b){
             alert('정답');
             location.href='/post/start/'+c;
                 }
            else if(a==null){
                a=document.getElementById('myan').value;
                if(a==b){
                    alert('정답');
                      location.href='/post/start/'+c;
                }
                else{
                    alert('틀림');
                      location.href='/post/start/'+c;
                }
            }
          else{
            alert('틀림');
            location.href='/post/start/'+c;
          }

        }
        function delete_cate(id){

          if(confirm('삭제?')==true){
          location.href='/post/ctdel/'+id;
        }
        else {

        }
        }

        function delete_exam(id){

            if(confirm('삭제?')==true){
            location.href='/post/exdel/'+id;
          }
          else {
  
          }
          }