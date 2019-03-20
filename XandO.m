classdef XandO
    %Noughts and Crosses Board and Game functions

    properties
        board
        past
        future
    end
    
    methods
        function a = XandO()
            %XandO Construct an instance of this class
            %Instantiate an empty board
            a.board = '         ';
            a.past = List([],[]);
            a.future = List([],[]);
            
            global mem
            mem = '         ';
            a.board = mem;
        end

        function display(a)
            %display renders the two dimensional board in the console
            r1 = {'+-------+'};
            r2 = strcat({'|'}, {' '}, {a.board(1)}, {' '}, {a.board(2)}, {' '}, {a.board(3)}, {' '}, {'|'});
            r3 = strcat({'|'}, {' '}, {a.board(4)}, {' '}, {a.board(5)}, {' '}, {a.board(6)}, {' '}, {'|'});
            r4 = strcat({'|'}, {' '}, {a.board(7)}, {' '}, {a.board(8)}, {' '}, {a.board(9)}, {' '}, {'|'});
            r5 = {'+-------+'};
            rendered_board = vertcat(r1,r2,r3,r4,r5);
            disp(rendered_board);
        end
        
        function empty_spaces = legalMoves(a)
            %XandO Construct an instance of this class
            %instantiate an empty board
            global mem
            empty_spaces = strfind(mem, ' '); 
        end

        function a = move(a, i)
            %Checks for legality then makes a move
            global mem

            if any(ismember(i, legalMoves(a)) > 0)
                mem(i) = 'X';
                a.board = mem;
                
                %Populates the first move in memory
                %Leaves the second move as 0 placeholder
                a.past = List([i, 0], a.past);
                a.future = List([], []);
                
                %Check if player has won
                if a.wins('X') == 1
                    disp('Player X wins!')
                    disp(' ')
                    return
                elseif isequal(strfind(a.board, ' '), [])
                    %Check for draw
                    disp('The game is a draw!')
                    disp(' ')
                    return
                end
                
                %Immediately Play the computers move
                a = computerMove(a);  
                
                %Check if the computer has won
                if a.wins('O') == 1
                    disp('Player O wins!')
                    disp(' ')
                end    
            else
                a.board = mem;
                disp('This is not a valid move!');
            end
        end

        function a = computerMove(a)
            %Checks for best legal move based on the following rules
            global mem
            o1 = a.board(1);
            o2 = a.board(2);
            o3 = a.board(3);
            o4 = a.board(4);
            o5 = a.board(5);
            o6 = a.board(6);
            o7 = a.board(7);
            o8 = a.board(8);
            o9 = a.board(9);
            %j = randsample(a.legalMoves, 1);
            
            %1. Checks for winning move
            %(1,2,3)
            if isequal(o1, 'O') && isequal(o3, 'O') && any(ismember(2, legalMoves(a)) > 0)
                j = 2;
            elseif isequal(o1, 'O') && isequal(o2, 'O') && any(ismember(3, legalMoves(a)) > 0)
                j = 3;
            elseif isequal(o2, 'O') && isequal(o3, 'O') && any(ismember(1, legalMoves(a)) > 0)
                j = 1;
            %(4,5,6)    
            elseif isequal(o4, 'O') && isequal(o6, 'O') && any(ismember(5, legalMoves(a)) > 0)
                j = 5;
            elseif isequal(o4, 'O') && isequal(o5, 'O') && any(ismember(6, legalMoves(a)) > 0)
                j = 6;
            elseif isequal(o5, 'O') && isequal(o6, 'O') && any(ismember(4, legalMoves(a)) > 0)
                j = 4;
            %(7,8,9)
            elseif isequal(o7, 'O') && isequal(o9, 'O') && any(ismember(8, legalMoves(a)) > 0)
                j = 8;
            elseif isequal(o7, 'O') && isequal(o8, 'O') && any(ismember(9, legalMoves(a)) > 0)
                j = 9;
            elseif isequal(o8, 'O') && isequal(o9, 'O') && any(ismember(7, legalMoves(a)) > 0)
                j = 7;
            %(1,4,7)
            elseif isequal(o1, 'O') && isequal(o4, 'O') && any(ismember(7, legalMoves(a)) > 0)
                j = 7;
            elseif isequal(o1, 'O') && isequal(o7, 'O') && any(ismember(4, legalMoves(a)) > 0)
                j = 4;
            elseif isequal(o4, 'O') && isequal(o7, 'O') && any(ismember(1, legalMoves(a)) > 0)
                j = 1;
            %(2,5,8)
            elseif isequal(o2, 'O') && isequal(o5, 'O') && any(ismember(8, legalMoves(a)) > 0)
                j = 8;
            elseif isequal(o2, 'O') && isequal(o8, 'O') && any(ismember(5, legalMoves(a)) > 0)
                j = 5;
            elseif isequal(o5, 'O') && isequal(o8, 'O') && any(ismember(2, legalMoves(a)) > 0)
                j = 2;
            %(3,6,9)
            elseif isequal(o3, 'O') && isequal(o6, 'O') && any(ismember(9, legalMoves(a)) > 0)
                j = 9;
            elseif isequal(o3, 'O') && isequal(o9, 'O') && any(ismember(6, legalMoves(a)) > 0)
                j = 6;
            elseif isequal(o6, 'O') && isequal(o9, 'O') && any(ismember(3, legalMoves(a)) > 0)
                j = 3;
            %(3,5,7)
            elseif isequal(o3, 'O') && isequal(o5, 'O') && any(ismember(7, legalMoves(a)) > 0)
                j = 7;
            elseif isequal(o3, 'O') && isequal(o7, 'O') && any(ismember(5, legalMoves(a)) > 0)
                j = 5;
            elseif isequal(o5, 'O') && isequal(o7, 'O') && any(ismember(3, legalMoves(a)) > 0)
                j = 3;
            %(1,5,9)
            elseif isequal(o1, 'O') && isequal(o5, 'O') && any(ismember(9, legalMoves(a)) > 0)
                j = 9;
            elseif isequal(o1, 'O') && isequal(o9, 'O') && any(ismember(5, legalMoves(a)) > 0)
                j = 5;
            elseif isequal(o5, 'O') && isequal(o9, 'O') && any(ismember(1, legalMoves(a)) > 0)
                j = 1;
            
            %2. Checks to block opponents winning move
            elseif isequal(o1, 'X') && isequal(o3, 'X') && any(ismember(2, legalMoves(a)) > 0)
                j = 2;
            elseif isequal(o1, 'X') && isequal(o2, 'X') && any(ismember(3, legalMoves(a)) > 0)
                j = 3;
            elseif isequal(o2, 'X') && isequal(o3, 'X') && any(ismember(1, legalMoves(a)) > 0)
                j = 1;
            %(4,5,6)    
            elseif isequal(o4, 'X') && isequal(o6, 'X') && any(ismember(5, legalMoves(a)) > 0)
                j = 5;
            elseif isequal(o4, 'X') && isequal(o5, 'X') && any(ismember(6, legalMoves(a)) > 0)
                j = 6;
            elseif isequal(o5, 'X') && isequal(o6, 'X') && any(ismember(4, legalMoves(a)) > 0)
                j = 4;
            %(7,8,9)
            elseif isequal(o7, 'X') && isequal(o9, 'X') && any(ismember(8, legalMoves(a)) > 0)
                j = 8;
            elseif isequal(o7, 'X') && isequal(o8, 'X') && any(ismember(9, legalMoves(a)) > 0)
                j = 9;
            elseif isequal(o8, 'X') && isequal(o9, 'X') && any(ismember(7, legalMoves(a)) > 0)
                j = 7;
            %(1,4,7)
            elseif isequal(o1, 'X') && isequal(o4, 'X') && any(ismember(7, legalMoves(a)) > 0)
                j = 7;
            elseif isequal(o1, 'X') && isequal(o7, 'X') && any(ismember(4, legalMoves(a)) > 0)
                j = 4;
            elseif isequal(o4, 'X') && isequal(o7, 'X') && any(ismember(1, legalMoves(a)) > 0)
                j = 1;
            %(2,5,8)
            elseif isequal(o2, 'X') && isequal(o5, 'X') && any(ismember(8, legalMoves(a)) > 0)
                j = 8;
            elseif isequal(o2, 'X') && isequal(o8, 'X') && any(ismember(5, legalMoves(a)) > 0)
                j = 5;
            elseif isequal(o5, 'X') && isequal(o8, 'X') && any(ismember(2, legalMoves(a)) > 0)
                j = 2;
            %(3,6,9)
            elseif isequal(o3, 'X') && isequal(o6, 'X') && any(ismember(9, legalMoves(a)) > 0)
                j = 9;
            elseif isequal(o3, 'X') && isequal(o9, 'X') && any(ismember(6, legalMoves(a)) > 0)
                j = 6;
            elseif isequal(o6, 'X') && isequal(o9, 'X') && any(ismember(3, legalMoves(a)) > 0)
                j = 3;
            %(3,5,7)
            elseif isequal(o3, 'X') && isequal(o5, 'X') && any(ismember(7, legalMoves(a)) > 0)
                j = 7;
            elseif isequal(o3, 'X') && isequal(o7, 'X') && any(ismember(5, legalMoves(a)) > 0)
                j = 5;
            elseif isequal(o5, 'X') && isequal(o7, 'X') && any(ismember(3, legalMoves(a)) > 0)
                j = 3;
            %(1,5,9)
            elseif isequal(o1, 'X') && isequal(o5, 'X') && any(ismember(9, legalMoves(a)) > 0)
                j = 9;
            elseif isequal(o1, 'X') && isequal(o9, 'X') && any(ismember(5, legalMoves(a)) > 0)
                j = 5;
            elseif isequal(o5, 'X') && isequal(o9, 'X') && any(ismember(1, legalMoves(a)) > 0)
                j = 1;

            %3. Checks for forks.
                %Not working properly yet.
            else
                for i = 1:9
                    p(i) = (a.board(i) == 'O');
                    s(i) = (a.board(i) == ' ');
                end
                %disp(p)
                %disp(s)
                
                for i = 1:2:9
                    %check triangle 
                    if isequal(p(mod(i, 10)), 1) && isequal(p(mod(i+2, 10)), 1) && any(ismember(mod(i+4, 10), legalMoves(a)) > 0)
                        j = mod(i+4, 10);
                    elseif isequal(p(mod(i, 10)), 1) && isequal(p(mod(i+4, 10)), 1) && any(ismember(mod(i+2, 10), legalMoves(a)) > 0)
                        j = mod(i+2, 10);
                    elseif isequal(p(mod(i+2, 10)), 1) && isequal(p(mod(i+4, 10)), 1) && any(ismember(mod(i, 10), legalMoves(a)) > 0)
                        j = mod(i, 10); 
                    else
                        j = randsample(a.legalMoves, 1);    
                    end 
                end
                   
            end        
                    
                    
            
            %4. Check to block opponents forks
            
            %5. Place in the position such that I may win in the most
            %   number of possible ways

            
            
            %As steps 3,4,5 are difficult to program, instead here's a
            % bodge job;
            
%             elseif isequal(o5, 'O')
%                 if isequal(o1, 'X') &&  any(ismember(9, legalMoves(a)) > 0)
%                     j = 9;
%                 elseif isequal(o3, 'X')  &&  any(ismember(7, legalMoves(a)) > 0)
%                     j = 7;
%                 elseif isequal(o7, 'X')  &&  any(ismember(3, legalMoves(a)) > 0)
%                     j = 3;
%                 elseif isequal(o9, 'X')  &&  any(ismember(1, legalMoves(a)) > 0)
%                     j = 1;
%                 end
%             %Triangle Tactic
%             elseif isequal(o5, 'O') && isequal(o9, 'O') &&  any(ismember(3, legalMoves(a)) > 0)
%                 j = 3;
%             elseif isequal(o5, 'O') && isequal(o9, 'O') &&  any(ismember(7, legalMoves(a)) > 0)
%                 j = 7;
%             elseif isequal(o5, 'O') && isequal(o7, 'O') &&  any(ismember(1, legalMoves(a)) > 0)
%                 j = 1;
%             elseif isequal(o5, 'O') && isequal(o7, 'O') &&  any(ismember(9, legalMoves(a)) > 0)
%                 j = 9;
%             elseif isequal(o5, 'O') && isequal(o3, 'O') &&  any(ismember(1, legalMoves(a)) > 0)
%                 j = 1;
%             elseif isequal(o5, 'O') && isequal(o3, 'O') &&  any(ismember(9, legalMoves(a)) > 0)
%                 j = 9;
%             elseif isequal(o5, 'O') && isequal(o1, 'O') &&  any(ismember(3, legalMoves(a)) > 0)
%                 j = 3;
%             elseif isequal(o5, 'O') && isequal(o1, 'O') &&  any(ismember(7, legalMoves(a)) > 0)
%                 j = 7;
            
            %Arrowhead Tactic
%             elseif isequal(o5, 'X') && any(ismember(2, legalMoves(a)) > 0)
%                 j = 2;
%             elseif isequal(o5, 'X') && any(ismember(4, legalMoves(a)) > 0)
%                 j = 4;
%             elseif isequal(o5, 'X') && any(ismember(6, legalMoves(a)) > 0)
%                 j = 6;
%             elseif isequal(o5, 'X') && any(ismember(8, legalMoves(a)) > 0)
%                 j = 8;
%                 
%             elseif isequal(o5, 'X') && isequal(o2, 'O') && any(ismember(4, legalMoves(a)) > 0)
%                 j = 4;
%             elseif isequal(o5, 'X') && isequal(o2, 'O') && any(ismember(6, legalMoves(a)) > 0)
%                 j = 6;
%             elseif isequal(o5, 'X') && isequal(o4, 'O') && any(ismember(2, legalMoves(a)) > 0)
%                 j = 2;
%             elseif isequal(o5, 'X') && isequal(o4, 'O') && any(ismember(8, legalMoves(a)) > 0)
%                 j = 8;
%             elseif isequal(o5, 'X') && isequal(o6, 'O') && any(ismember(2, legalMoves(a)) > 0)
%                 j = 2;
%             elseif isequal(o5, 'X') && isequal(o6, 'O') && any(ismember(8, legalMoves(a)) > 0)
%                 j = 8;
%             elseif isequal(o5, 'X') && isequal(o8, 'O') && any(ismember(4, legalMoves(a)) > 0)
%                 j = 4;
%             elseif isequal(o5, 'X') && isequal(o8, 'O') && any(ismember(6, legalMoves(a)) > 0)
%                 j = 6;
%       
%             elseif isequal(o2, 'O') && isequal(o4, 'O') && any(ismember(1, legalMoves(a)) > 0)
%                 j = 1;
%             elseif isequal(o2, 'O') && isequal(o6, 'O') && any(ismember(3, legalMoves(a)) > 0)
%                 j = 6;
%             elseif isequal(o4, 'O') && isequal(o8, 'O') && any(ismember(7, legalMoves(a)) > 0)
%                 j = 7;
%             elseif isequal(o6, 'O') && isequal(o8, 'O') && any(ismember(9, legalMoves(a)) > 0)
%                 j = 9;
%             else
%                 %if all else fails
%                 j = randsample(a.legalMoves, 1);
%             end 
            %Populates the second move in memory
            a.past.head(2) = j;
            
            %Set the final move decided on equal to j   
            mem(j) = 'O';
            a.board = mem;
        end
        
        function a = undo(a)
            %Checks to see if can undo, then proceeds to undo the last pair
            %of moves.
            global mem
            if isequal(a.past.head, [])
                disp('There are no moves to undo');
            elseif isequal(strfind(a.board, ' '), [])
                %In the case when the board is full, only remove the last
                %player move.
                mem(a.past.head(1)) = ' ';
                a.board = mem;
                
                %Adds removed moves to head of a.future
                a.future = List(a.past.head, a.future);
            
                %Removes the head of the list a.past
                a.past = a.past.tail;
            else
            
                %Removes the most recent 2 moves played from the board
                mem(a.past.head(1)) = ' ';
                mem(a.past.head(2)) = ' ';
                a.board = mem;

                %Adds removed moves to head of a.future
                a.future = List(a.past.head, a.future);

                %Removes the head of the list a.past
                a.past = a.past.tail;
            end
        end
        
        function a = redo(a)
            %Checks to see if can redo, then proceeds to redo the last pair
            %of moves stored in a.future.
            global mem
            if isequal(a.future.head, [])
                disp('There are no moves to redo');
                
            elseif isequal(length(strfind(a.board, ' ')), 1)
                %In the case where you redo the final move
                mem(a.future.head(1)) = 'X';
                a.board = mem;
                
                %Adds removed moves to head of a.past
                a.past = List(a.future.head, a.past);

                %Removes the head of the list a.future
                a.future = a.future.tail;
                
            else
                %Replays the most recent 2 moves undone on the board
                mem(a.future.head(1)) = 'X';
                mem(a.future.head(2)) = 'O';
                a.board = mem;

                %Adds removed moves to head of a.past
                a.past = List(a.future.head, a.past);

                %Removes the head of the list a.future
                a.future = a.future.tail;
            end
            
            %After the move is redone, check if either team has won.
            if a.wins('X') == 1
                disp('Player X wins!')
                disp(' ')
            elseif a.wins('O') == 1
                disp('Player O wins!')
                disp(' ')
            end
        end
        
        function winner = wins(a, p)
            % Checks if player X or O has won
            global mem
            for i = 1:3:7
                % Tests for [1,2,3],[4,5,6],[7,8,9]
                x1 = i; x2 = i+1; x3 = i+2;
                P = (mem(x1) == p) && (mem(x2) == p) && (mem(x3) == p);
                if P
                    winner = 1;
                    return
                end
            end
            
            for i = 1:3
                % Tests for [1,4,7],[2,5,8],[3,6,9]
                x1 = i; x2 = i+3; x3 = i+6;
                P = (mem(x1) == p) && (mem(x2) == p) && (mem(x3) == p);
                if P
                    winner = 1;
                    return
                end
            end
            % Tests for [1,5,9]
            x1 = 1; x2 = 5; x3 = 9;
            P = (mem(x1) == p) && (mem(x2) == p) && (mem(x3) == p);
            if P
                winner = 1;
                return
            end
            % Tests for [3,5,7]
            x1 = 3; x2 = 5; x3 = 7;
            P = (mem(x1) == p) && (mem(x2) == p) && (mem(x3) == p);
            if P
                winner = 1;
                return
            else
                winner = 0;
            end
        end       
    end
end