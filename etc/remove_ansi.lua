function remove_ansi_escape_codes(tag, timestamp, record)
    if record["log"] ~= nil then
        local log = record["log"]
        -- A more robust pattern to capture ANSI escape sequences, including incomplete ones like [m
        log = log:gsub("\x1B%[%d*;?%d*;?%d*m", "")  -- Remove complete ANSI color codes
        log = log:gsub("%[%d+m", "")                -- Remove any leftover escape code residues (like [m)
        record["log"] = log -- Update the log field with cleaned content
    end
    return 1, timestamp, record -- Return the cleaned record
end
