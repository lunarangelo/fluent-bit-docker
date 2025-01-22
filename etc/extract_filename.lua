function extract_filename(tag, timestamp, record)
    local log_path = record["log-path"]
    if log_path then
        local filename = log_path:match("^.+/(.+)$")
        record["log-file"] = filename
    else
        record["log-file"] = "unknown"
    end
    return 1, timestamp, record
end

