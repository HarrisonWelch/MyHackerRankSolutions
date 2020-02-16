function clickMe() {
  var arr = [];
  var reorderArray = [4,1,2,7,5,3,8,9,6];
  for (var i = 1; i <= 9; i++) {
    // console.log(i)
    arr.push(document.getElementById('btn'+i).innerHTML);
  }
  // console.log("arr = " + arr);
  for (var i = 0; i < 9; i++) {
    // console.log(i)
    // console.log("reorderArray[i] = "+reorderArray[i]);
    // console.log("arr[reorderArray[i]] = "+arr[reorderArray[i]-1]);
    document.getElementById('btn'+(i+1)).innerHTML = arr[reorderArray[i]-1];
  }  
}
