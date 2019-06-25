BEGIN {
    FS="] ";
}
{
    print "{\"@date\":\""substr($1,2)"\", \"level\":\""substr($2,2)"\", \"type\":\"dispatcher\", \"format\":\"simple\", \"pid\":\""substr($3,2)"\", \"message\":\""$4"\"}";
}