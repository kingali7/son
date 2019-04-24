(* CSCI3180 Principles of Programming Languages

* --- Declaration ---

* I declare that the assignment here submitted is original except for source
* material explicitly acknowledged. I also acknowledge that I am aware of
* University policy and regulations on honesty in academic work, and of the
* disciplinary guidelines and procedures applicable to breaches of such policy
* and regulations, as contained in the website
* http://www.cuhk.edu.hk/policy/academichonesty/
* Credits to the my roommate Huzeyfe KIRAN(1155104019).
* Assignment 4
* Name : Alshir Soyunjov
* Student ID : 1155119170
*)
datatype suit = Clubs | Diamonds | Hearts | Spades;
datatype rank = Jack | Queen | King | Ace | Num of int;
type card = suit * rank;

datatype color = Red | Black;
datatype move = Discard of card | Draw;

fun abs x = if x >= 0 then x else ~x;

fun cardColor(x:suit,y:rank):color = if x=Diamonds orelse x=Hearts then Red else Black;

fun cardValue(_,Num i) = i
|   cardValue(_,Jack) = 10
|   cardValue(_,Queen) = 10
|   cardValue(_,King) = 10
|   cardValue(_,Ace) = 11;

fun numOfCard(cardList:(suit*rank) list): int =  
         if null(cardList) then 0
         else 1 + numOfCard(tl(cardList));

fun removeCard(l:(suit*rank) list, s:suit, r:rank):(suit*rank) list =
        if (s,r) = hd(l) then tl(l)
        else [hd(l)]@removeCard(tl(l),s,r);

fun sumCards(cardList:(suit*rank) list, col:color):int =
        if null(cardList) then 0
        else if cardColor(hd(cardList)) = col then cardValue(hd(cardList)) + sumCards(tl(cardList),col)
        else sumCards(tl(cardList),col);

fun score(cardList:(suit*rank) list):int = abs(sumCards(cardList,Red) - sumCards(cardList,Black)) + 6 - numOfCard(cardList);

fun runGame(cardList,moveList) =
            let
                    fun runGameA([],Draw,moveList,heldCards) = score(heldCards)
                    |   runGameA(cardList,Draw,moveList,heldCards) =
                                if length(hd(cardList)::heldCards) > 5 orelse null(moveList) then score(hd(cardList)::heldCards)
                                else runGameA(tl(cardList),hd(moveList),tl(moveList),hd(cardList)::heldCards)
                    |   runGameA(cardList,Discard (x,y),moveList,heldCards) =
                                if null(moveList) then score(removeCard(heldCards,x,y))
                                else runGameA(cardList,hd(moveList),tl(moveList),removeCard(heldCards,x,y))

            in
                    runGameA(cardList,hd(moveList),tl(moveList),[])
            end;



