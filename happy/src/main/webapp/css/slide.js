function shuffleArray(array) {
  for (let i = 0; i < array.length; i++) {
    let j = Math.floor(Math.random() * (i + 1));
    // [array[i], array[j]] = [array[j], array[i]];
    const x = array[i];
    array[i] = array[j];
    array[j] = x;
  }
  return array;
};

function answer_check(a, b, c) {
	if (a == b) {
		alert('정답');
		location.href = '/post/start/' + c;
	}
	else if (a == null) {
		a = document.getElementById('myan').value;
		if (a == b) {
			alert('정답');
			location.href = '/post/start/' + c;
		}
		else {
			alert('틀림');
			location.href = '/post/start/' + c;
		}
	}
	else {
		alert('틀림');
		location.href = '/post/start/' + c;
	}

}
function delete_cate(id) {

	if (confirm('삭제?') == true) {
		location.href = '/post/ctdel/' + id;
	}
	else {

	}
}

function delete_exam(id) {

	if (confirm('삭제?') == true) {
		location.href = '/post/exdel/' + id;
	}
	else {

	}
}