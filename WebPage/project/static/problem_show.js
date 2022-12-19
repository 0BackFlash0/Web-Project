
async function send_SQL(query){

    let result = await fetch("/runSQL", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({
            "query": query
        }),
        }).then((response) => response.json());
    
    return result
}

async function check_answer(){
    let problem_type = document.querySelector(".problem_type")
    let problem_id = document.querySelector(".problem_id").innerText
    let db;
    let answer;
    let correct;
    if(problem_type.innerText == "객관식"){
        try{
            db = "objective"
            answer = document.querySelector(".problem_answer:checked").value

        }
        catch (TypeError){
            console.log("정답을 선택해주세요.")
            return;
        }
    }
    else{
        db = "subjective"
        answer = document.querySelector(".problem_answer").value
        if(answer=="") {console.log("정답을 입력해주세요."); return;}
    }

    correct = await send_SQL(`SELECT CASE WHEN answer = '${answer}' THEN TRUE ELSE FALSE END AS result FROM ${db} WHERE id = ${problem_id}`)
    if(correct[0]["result"]) console.log("정답입니다!");
    else console.log("오답입니다.")
    return
}

window.onload = function () {
    answer_button = document.querySelector(".answer_button")
    answer_button.addEventListener('click', () => {
        answer_input = document.querySelector(".answer_input")
        if(answer_input.classList.contains("deactivate")){
            answer_button.innerText = "- 정답 입력"
        }
        else{
            answer_button.innerText = "+ 정답 입력"
        }
        answer_input.classList.toggle("deactivate")
    })

    answer_commit = document.querySelector(".answer_commit")
    answer_commit.addEventListener('click', () => {
        check_answer()
    })
}