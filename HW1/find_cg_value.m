function highest_content = find_cg_value(aa_cell)

    % Helper function that will find total number of c and g characters within some string
    cg_count = 0;
    index=0;
    for (i=1:length(aa_cell)) %Iterate through the string
        
        x = count(aa_cell(i), {'G', 'C'}); % Count G and C
        
        if (x >= cg_count) % Simple search for highest cg count
            cg_count = x;
            index = i;
        end
    end
    
    highest_content = aa_cell(index); % Return codon with highest cg


    


end