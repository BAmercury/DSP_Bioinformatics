function highest_content = find_cg_value(aa_cell)

    % Helper function that will find total number of cg within some string
    cg_count = 0
    index=0;
    for (i=1:length(aa_cell))
        
        x = count(aa_cell(i), {'G', 'C'});
        
        if (x >= cg_count)
            cg_count = x;
            index = i;
        end
    end
    
    highest_content = aa_cell(index);


    


end