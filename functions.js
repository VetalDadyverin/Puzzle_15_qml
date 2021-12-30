function check_zero(number_index, zero_index){
    var difference = Math.abs(number_index - zero_index);
    return (difference === 1 && Math.floor(number_index / 4, 10) === Math.floor(zero_index / 4, 10) ) || (difference == 4)
}

function find_zero(model){
    for(var i = 0; i < model.count; ++i){
        if(model.get(i).number === 0){
            return i;
        }
    }
}

function swap(first, second, model){
    if(first > second){
        model.move(first, second, 1);
        model.move(second + 1, first, 1);
    }
    else{
        model.move(second, first, 1);
        model.move(first + 1, second, 1);
    }
}

function shuffle(model){
    var from, to;
    do{
        for(var i = 0; i < 200; ++i){
            from = Math.floor(Math.random() * 16);
            to = Math.floor(Math.random() * 16);
            model.move(from, to, 1);
        }
    } while (check_shuffled(model))

}

function check_shuffled(model){
    var result = 0;
    for(var i = 0; i < model.count; ++i){
        if(model.get(i).number !== 0){
            for(var j = 0; j < i; ++j){
                if(model.get(j).number !== 0){
                    if(model.get(i).number < model.get(j).number){
                        result++;
                    }
                }
            }
        }
    }
    result += Math.floor(find_zero(model) / 4) + 1;
    return !(result & 1);
}

function check_solved(model) {
    for (var i = 0; i <= model.count - 2; ++i) {
        if (model.get(i).number !== i + 1){
            return false;
        }
    }
    return true;
}

function fill_model(model, number){
    for(var i = 0; i < number; ++i){
        model.append({number: i});
    }
}
