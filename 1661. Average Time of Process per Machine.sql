select machine_id, round(sum(endTime-startTime)/count(process_id), 3) as processing_time from

    (select  
        machine_id,
        process_id,         
        max(timestamp) as endTime,
        min(timestamp) as startTime            
    from activity  
    group by machine_id, process_id)x

group by machine_id