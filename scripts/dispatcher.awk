BEGIN {
    RS="";
    FS="\n";
}
{
    field_date_length = length($1)-2;
    field_date = substr($1,2,field_date_length);
    field_level_length = length($2)-2;
    field_level = substr($2,2,field_level_length);
    field_pid_length = length($3)-2;
    field_pid = substr($3,2,field_pid_length);
    field_message_length = length($4)-2;
    field_message = substr($4,2,field_message_length);

    split(field_message, field_message_array, " ")

    field_method=field_message_array[1]
    field_url=field_message_array[2]


    field_status_length = length($5)-1;
    field_status = substr($5,1,field_status_length);
    field_size_length = length($6)-1;
    field_size = substr($6,1,field_size_length);
    field_duration_length = length($7)-1;
    field_duration = substr($7,1,field_duration_length);
    field_renderer_length = length($8)-2;
    field_renderer = substr($8,2,field_renderer_length);
    print "{\"@date\":\""field_date"\", \"level\":\""field_level"\", \"type\":\"dispatcher\", \"format\":\"render\", \"pid\":\""field_pid"\", \"method\":\""field_method"\", \"path\":\""field_url"\", \"status\":\""field_status"\", \"size\":\""field_size"\", \"duration\":\""field_duration"\", \"renderer\":\""field_renderer"\"}";
}