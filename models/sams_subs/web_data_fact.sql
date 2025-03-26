{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
) }}

SELECT
    D.Date_day,
    et.Event_Type,
    ts.Traffic_Source,
    pu.Page_Url,
    w._line
FROM {{ source('traffic_landing', 'web_traffic_events') }} w
INNER JOIN {{ ref('date_dim') }} d ON d.date_day = CAST(w.event_timestamp AS DATE)  -----this one isn't going to work. work with chatgpt 
INNER JOIN {{ ref('EventType_dim') }} et ON et.Event_Type = w.event_name ------look at this one again
INNER JOIN {{ ref('TrafficSource_dim') }} ts ON ts.Traffic_Source = w.traffic_source 
INNER JOIN {{ ref('pageurl_dim') }} pu ON pu.Page_URL = w.Page_Url