classdef List
    % List: a class for linked lists
    properties
        head % the data point
        tail % the remainder of the list
    end
    
    methods
        % The constructor method
        function l = List(x,k)
            l.head = x;
            l.tail = k;
        end
        
        function n = isNil(l)
            if l == List([],[])
                n = 1;
            else 
                n = 0;
            end
        end
    end
end