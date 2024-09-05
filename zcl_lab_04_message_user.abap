CLASS zcl_lab_04_message_user DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
    DATA: mv_order_status TYPE string VALUE 'Purchase Completed Successfully',
          mv_char_number  TYPE i,
          mv_pattern      TYPE string VALUE '\d{3}-\d{3}-\d{4}',
          mv_phone        TYPE string VALUE '424-222-9999',
          mv_email        TYPE string VALUE 't100437@logali.com'.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_lab_04_message_user IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
*    Text symbols
    out->write( TEXT-001 ).

*    Description functions
*    Count the length of characters
    me->mv_char_number = strlen( me->mv_order_status ).
    out->write( |Length (STRLEN): { me->mv_char_number }| ).

    me->mv_char_number = numofchar( me->mv_order_status ).
    out->write( |Length (NUMOFCHAR): { me->mv_char_number }| ).

*    Count the number of 'A' characters
    me->mv_char_number = count( val = me->mv_order_status sub = 'A' case = abap_false ).
    out->write( |Count 'A' character: { me->mv_char_number }| ).

*    Find the position of the pattern 'Exit'
    me->mv_char_number = find( val = me->mv_order_status sub = 'Exit' ).
    out->write( |Position of 'Exit': { me->mv_char_number }| ).

*    Processing functions
*    Change format
    out->write( |Uppercase: { to_upper( me->mv_order_status ) }| ).
    out->write( |Lowercase: { to_lower( me->mv_order_status ) }| ).
    out->write( |Mixed: { to_mixed( me->mv_order_status ) }| ).

*    Shift the first 5 characters to the end of the variable
    me->mv_order_status = shift_left( val = me->mv_order_status circular = 9 ).
    out->write( |Shift String: { me->mv_order_status }| ).

*    Extract the word "Completed" from the variable
    me->mv_order_status = substring( val = me->mv_order_status off = 0 len = 9 ).
    out->write( |Extracted Word: { me->mv_order_status }| ).

*    Reverse the order of the characters in the variable
    me->mv_order_status = reverse( me->mv_order_status ).
    out->write( |Reversed Word: { me->mv_order_status }| ).

*   Content functions
*    Validate Phone
    IF contains( val = mv_phone pcre = mv_pattern ).
      out->write( |The phone number is in the correct format| ).
    ELSE.
      out->write( |The phone number is not in the correct format| ).
    ENDIF.

*   Functions with regular expressions
*    Validate Email
    me->mv_pattern = '\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b'.

    IF contains( val = mv_email pcre = mv_pattern ).
      out->write( |The email is in the correct format| ).
    ELSE.
      out->write( |The email is not in the correct format| ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.