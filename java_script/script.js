var button, field , count = 0;


function  move (num_of_button){     
    button = document.getElementById("id_" + num_of_button).innerHTML; 
    if(button === "") {
        document.getElementById("id_" + num_of_button).innerHTML  = "X"; 
    }
    count += 1; 
    winner();      
    computer_turn(); 
}


function winner(){ 
    field =  document.getElementsByClassName("block");

    lines = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8], 
        [2, 4, 6]
    ]
    for (index_of_line = 0; index_of_line < lines.length; index_of_line++){
        if(field[lines[index_of_line][0]].innerHTML =='X' & field[lines[index_of_line][1]].innerHTML =='X' & field[lines[index_of_line][2]].innerHTML =='X'){alert('Крестики победили!');  fail;} 
        if(field[lines[index_of_line][0]].innerHTML =='0' & field[lines[index_of_line][1]].innerHTML =='0' & field[lines[index_of_line][2]].innerHTML =='0'){alert('Нолики победили!');  fail;} 
    }
    // if(field[0].innerHTML =='X' & field[1].innerHTML =='X' & field[2].innerHTML =='X'){alert('Крестики победили!');  fail;} 
    // if(field[3].innerHTML =='X' & field[4].innerHTML =='X' & field[5].innerHTML =='X'){alert('Крестики победили!');  fail;}  
    // if(field[6].innerHTML =='X' & field[7].innerHTML =='X' & field[8].innerHTML =='X'){alert('Крестики победили!');  fail;}

    // if(field[0].innerHTML =='X' & field[3].innerHTML =='X' & field[6].innerHTML =='X'){alert('Крестики победили!');  fail;} 
    // if(field[1].innerHTML =='X' & field[4].innerHTML =='X' & field[7].innerHTML =='X'){alert('Крестики победили!');  fail;}  
    // if(field[2].innerHTML =='X' & field[5].innerHTML =='X' & field[8].innerHTML =='X'){alert('Крестики победили!');  fail;}

    // if(field[0].innerHTML =='X' & field[4].innerHTML =='X' & field[8].innerHTML =='X'){alert('Крестики победили!');  fail;} 
    // if(field[2].innerHTML =='X' & field[4].innerHTML =='X' & field[6].innerHTML =='X'){alert('Крестики победили!');  fail;}  

    // if(field[0].innerHTML =='0' & field[1].innerHTML =='0' & field[2].innerHTML =='0'){alert('Нолики победили!');  fail;} 
    // if(field[3].innerHTML =='0' & field[4].innerHTML =='0' & field[5].innerHTML =='0'){alert('Нолики победили!');  fail;}  
    // if(field[6].innerHTML =='0' & field[7].innerHTML =='0' & field[8].innerHTML =='0'){alert('Нолики победили!');  fail;}

    // if(field[0].innerHTML =='0' & field[3].innerHTML =='0' & field[6].innerHTML =='0'){alert('Нолики победили!');  fail;} 
    // if(field[1].innerHTML =='0' & field[4].innerHTML =='0' & field[7].innerHTML =='0'){alert('Нолики победили!');  fail;}  
    // if(field[2].innerHTML =='0' & field[5].innerHTML =='0' & field[8].innerHTML =='0'){alert('Нолики победили!');  fail;}

    // if(field[0].innerHTML =='0' & field[4].innerHTML =='0' & field[8].innerHTML =='0'){alert('Нолики победили!');  fail;} 
    // if(field[2].innerHTML =='0' & field[4].innerHTML =='0' & field[6].innerHTML =='0'){alert('Нолики победили!');  fail;}

    if(count == "9") { alert('Ничья!');   } 
    
}

function computer_turn(){
    
    field =  document.getElementsByClassName("block");
    array_of_empty_cell = [];
    
    for (index = 0; index < field.length; ++index) {
        if (field[index].innerHTML != 'X' & field[index].innerHTML != '0'){array_of_empty_cell.push(index)}
    }
    document.getElementById("id_" + array_of_empty_cell[Math.floor(Math.random() * array_of_empty_cell.length)]).innerHTML  = "0"; 
    count += 1; 
    winner(); 
}