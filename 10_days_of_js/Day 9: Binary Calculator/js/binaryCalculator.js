function zero(){
  document.getElementById('res').innerHTML += '0';
}
function one() {
  document.getElementById('res').innerHTML += '1';
}
function clearRes() {
  // console.log('clearRes');
  document.getElementById('res').innerHTML = '';
}
function equalsRes() {
  // console.log('equalsRes');
  // firstOp
  var parseString = document.getElementById('res').innerHTML;
  var firstOp = '';
  // var firstChar = parseString[0];
  var curr = 0;
  while (parseString[curr] != '+' &&
         parseString[curr] != '-' &&
         parseString[curr] != '*' &&
         parseString[curr] != '/') {
    // console.log('loop firstOp = ' + firstOp);
    firstOp += parseString[curr];
    curr++;
    // if (curr == 10) {
    //   break;
    // }
  }
  // console.log('firstOp = ' + firstOp);
  var op = parseString[curr];
  curr++;
  // console.log('op = ' + op);
  var secondOp = ''
  for (var i = curr; i < parseString.length; i++) {
    secondOp += parseString[i]
  }
  // console.log('firstOp = ' + firstOp);
  // console.log('op = ' + op);
  // console.log('secondOp = ' + secondOp);
  var result = 0;
  switch (op) {
    case '+':
      result = parseInt(firstOp, 2) + parseInt(secondOp, 2);
      break;
    case '-':
      result = parseInt(firstOp, 2) - parseInt(secondOp, 2);
      break;
    case '*':
      result = parseInt(firstOp, 2) * parseInt(secondOp, 2);
      break;
    case '/':
      result = Math.floor(parseInt(firstOp, 2) / parseInt(secondOp, 2));
      break;
  }
  document.getElementById('res').innerHTML = result.toString(2);
}
function add() {
  document.getElementById('res').innerHTML += '+';
}
function sub() {
  document.getElementById('res').innerHTML += '-';
}
function mul(){
  document.getElementById('res').innerHTML += '*';
}
function div() {
  document.getElementById('res').innerHTML += '/';
}