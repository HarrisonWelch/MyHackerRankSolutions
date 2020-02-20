// https://www.hackerrank.com/challenges/js10-template-literals/problem

'use strict';

process.stdin.resume();
process.stdin.setEncoding('utf-8');

let inputString = '';
let currentLine = 0;

process.stdin.on('data', inputStdin => {
    inputString += inputStdin;
});

process.stdin.on('end', _ => {
    inputString = inputString.trim().split('\n').map(string => {
        return string.trim();
    });
    
    main();    
});

function readLine() {
    return inputString[currentLine++];
}

/*
 * Determine the original side lengths and return an array:
 * - The first element is the length of the shorter side
 * - The second element is the length of the longer side
 * 
 * Parameter(s):
 * literals: The tagged template literal's array of strings.
 * expressions: The tagged template literal's array of expression values (i.e., [area, perimeter]).
 */
function sides(literals, ...expressions) {
    // console.log('literals = ' + literals);
    // console.log('expressions = ' + expressions);
    var s = [];

    // let values = []
    // for (var i = 0; i < expressions.entries(); i++){
        
    // }
    var A = expressions[0];
    var P = expressions[1];
    var s1 = (P + Math.sqrt(Math.pow(P,2) - (16*A))) / 4;
    var s2 = (P - Math.sqrt(Math.pow(P,2) - (16*A))) / 4;
    // console.log('s1 = ' + s1);
    // console.log('s2 = ' + s2);
    var arr = [s2,s1]
    // console.log('arr = ' + arr);
    return arr;
}


function main() {
    let s1 = +(readLine());
    let s2 = +(readLine());
    
    [s1, s2] = [s1, s2].sort();
    
    const [x, y] = sides`The area is: ${s1 * s2}.\nThe perimeter is: ${2 * (s1 + s2)}.`;
    
    console.log((s1 === x) ? s1 : -1);
    console.log((s2 === y) ? s2 : -1);
}
