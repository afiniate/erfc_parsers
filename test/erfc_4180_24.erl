%%% Copyright (c) 2011, Afiniate, Inc
%%% All rights reserved.
%%%
%%% You may use this file under the terms of the MIT License. See the
%%% license distributed with this project or
%%% http://www.opensource.org/licenses/mit-license.php

-module(erfc_4180_24).

-export([given/3, 'when'/3, then/3]).

-include_lib("eunit/include/eunit.hrl").

given([valid, csv, file], _State, _) ->
    {ok, csv_content()}.

'when'([erfc_4180,parses,that,file], _State, _) ->
    {ok, erfc_4180:parse(erlang:list_to_binary(csv_content()),
                                               [{1, atom},
                                                {2, date},
                                                {3, integer},
                                                {6, currency},
                                                {8, atom},
                                                {9, integer}])}.

then([the,parsed,record,fields,have,the,correct,types], Records, _) ->
    ?assertMatch({cleared,{{1954,10,11}, _},
                  5305,"TRANSFER ","5305",-2.5e3,[],'\'1234567890\'',"13245"},
                 lists:nth(1, Records)),
    ?assertMatch({cleared,{{1954,10,3},_},
                  7104,"TRANSFER Sep 30 22:43","7104",1.0e3,[],'\'1234567890\'',
                  "13245"},
                 lists:nth(2, Records)),
    ?assertMatch({cleared,{{1954,10,3},_},
                  100,"INTEREST",[],1.19,[],'\'1234567890\'',"13245"},
                 lists:nth(3, Records)),
    ?assertMatch({cleared,{{1954,10,3},_},
                  533,"TRANSFER Oct 01 23:22","533",-1875.0,[],'\'1234567890\'',
                  "13245"},
                 lists:nth(4, Records)),
    ?assertMatch({cleared,{{1954,9,30},_},
                  0,"XFER    TRANSFER","OTHER DECREASE Sep 30 06:35",-1.0e3,[],
                  '\'1234567890\'',"13245"},
                 lists:nth(5, Records)),
    ?assertMatch({cleared,{{1954,9,29},_},
                  1499,"TRANSFER Sep 29 17:26","1499",-2.5e3,[],'\'1234567890\'',
                  "13245"},
                 lists:nth(6, Records)),
    ?assertMatch({cleared,{{1954,9,27},_},
                  0,"GAS      DRAFT","OTHER DECREASE               Sep 27 06:21",
                  -23.78,[],'\'1234567890\'',"13245"},
                 lists:nth(7, Records)),
    ?assertMatch({cleared,{{1954,9,23},_},
                  1948,"TRANSFERSep 23 12:39 8860","1948",21710.0,[],'\'1234567890\'',
                  "13245"},
                 lists:nth(8, Records)),
    ?assertMatch({cleared,{{1954,9,15},_},
                  1683,"TRANSFERSep 15 09:50 8860","1683",1.19e4,[],'\'1234567890\'',
                  "13245"},
                 lists:nth(9, Records)),
    ?assertMatch({cleared,{{1954,9,1},_},
                  4329,"TRANSFERSep 01 10:19 8860","4329",11904.0,[],'\'1234567890\'',
                  "13245"},
                 lists:nth(10, Records)),
    ?assertMatch({cleared,{{1954,9,1},_},
                  145,"INTEREST",[],1.25,[],'\'1234567890\'',"13245"},
                 lists:nth(11, Records)),
    ?assertMatch({cleared,{{1954,8,25},_},
                  0,"GAS      DRAFT","OTHER DECREASE               Aug 25 06:24",
                  -24.24,[],'\'1234567890\'',"13245"},
                 lists:nth(12, Records)),
    ?assertMatch({cleared,{{1954,8,17},_},
                  10,"FEE-INT'L WIRE               Aug 17 11:02",[],30.0,[],
                  '\'1234567890\'',"13245"},
                 lists:nth(13, Records)),
    ?assertMatch({cleared,{{1954,8,17},_},
                  0,"INTL WIRE OUT                Aug 17 11:02","CBOL WIRE",-2010.0,
                  [],'\'1234567890\'',"13245"},
                 lists:nth(14, Records)),
    ?assertMatch({cleared,{{1954,8,15},_},
                  3795,"TRANSFERAug 15 11:06 8860","3795",945.0,[],'\'1234567890\'',
                  "13245"},
                 lists:nth(15, Records)),
    ?assertMatch({cleared,{{1954,8,11},_},
                  2299,"TRANSFERAug 10 23:08 8860","2299",-800.0,[],'\'1234567890\'',
                  "13245"},
                 lists:nth(16, Records)),
    ?assertMatch({cleared,{{1954,8,1},_},
                  100,"INTEREST",[],0.75,[],'\'1234567890\'',"13245"},
                 lists:nth(17, Records)),
    ?assertMatch({cleared,{{1954,7,29},_},
                  7258,"TRANSFERJul 29 13:08 8860","7258",1.0e3,[],'\'1234567890\'',
                  "13245"},
                 lists:nth(18, Records)),
    ?assertMatch({cleared,{{1954,7,29},_},
                  0,"XFER    TRANSFER","OTHER DECREASE               Jul 29 06:40",
                  -1.0e3,[],'\'1234567890\'',"13245"},
                 lists:nth(19, Records)),
    ?assertMatch({cleared,{{1954,7,28},_},
                  0,"XFER    TRANSFER","OTHER DECREASE               Jul 28 06:33",
                  -1.0e3,[],'\'1234567890\'',"13245"},
                 lists:nth(20, Records)),
    ?assertMatch({cleared,{{1954,7,27},_},
                  0,"GAS      DRAFT","OTHER DECREASE               Jul 27 06:20",
                  -25.63,[],'\'1234567890\'',"13245"},
                 lists:nth(21, Records)),
    ?assertMatch({cleared,{{1954,7,25},_},
                  3166,"TRANSFERJul 25 12:55","3166",-328.0,[],'\'1234567890\'',
                  "13245"},
                 lists:nth(22, Records)),
    {ok, Records}.

csv_content() ->
    "cleared,10/11/1954,05305,\"TRANSFER \",\"5305\",\"-2,500.00\",\"\",'1234567890',13245
cleared,10/03/1954,07104,\"TRANSFER Sep 30 22:43\",\"7104\",\"1,000.00\",\"\",'1234567890',13245
cleared,10/03/1954,00100,\"INTEREST\",\"\",\"1.19\",\"\",'1234567890',13245
cleared,10/03/1954,00533,\"TRANSFER Oct 01 23:22\",\"533\",\"-1875.00\",\"\",'1234567890',13245
cleared,09/30/1954,,\"XFER    TRANSFER\",\"OTHER DECREASE Sep 30 06:35\",\"-1,000.00\",\"\",'1234567890',13245
cleared,09/29/1954,01499,\"TRANSFER Sep 29 17:26\",\"1499\",\"-2500.00\",\"\",'1234567890',13245
cleared,09/27/1954,,\"GAS      DRAFT\",\"OTHER DECREASE               Sep 27 06:21\",\"-23.78\",\"\",'1234567890',13245
cleared,09/23/1954,01948,\"TRANSFERSep 23 12:39 8860\",\"1948\",\"21,710.00\",\"\",'1234567890',13245
cleared,09/15/1954,01683,\"TRANSFERSep 15 09:50 8860\",\"1683\",\"11,900.00\",\"\",'1234567890',13245
cleared,09/01/1954,04329,\"TRANSFERSep 01 10:19 8860\",\"4329\",\"11,904.00\",\"\",'1234567890',13245
cleared,09/01/1954,00145,\"INTEREST\",\"\",\"1.25\",\"\",'1234567890',13245
cleared,08/25/1954,,\"GAS      DRAFT\",\"OTHER DECREASE               Aug 25 06:24\",\"-24.24\",\"\",'1234567890',13245
cleared,08/17/1954,00010,\"FEE-INT'L WIRE               Aug 17 11:02\",\"\",\"/30.00\",\"\",'1234567890',13245
cleared,08/17/1954,,\"INTL WIRE OUT                Aug 17 11:02\",\"CBOL WIRE\",\"-2,010.00\",\"\",'1234567890',13245
cleared,08/15/1954,03795,\"TRANSFERAug 15 11:06 8860\",\"3795\",\"945.00\",\"\",'1234567890',13245
cleared,08/11/1954,02299,\"TRANSFERAug 10 23:08 8860\",\"2299\",\"-800.00\",\"\",'1234567890',13245
cleared,08/01/1954,00100,\"INTEREST\",\"\",\"0.75\",\"\",'1234567890',13245
cleared,07/29/1954,07258,\"TRANSFERJul 29 13:08 8860\",\"7258\",\"1,000.00\",\"\",'1234567890',13245
cleared,07/29/1954,,\"XFER    TRANSFER\",\"OTHER DECREASE               Jul 29 06:40\",\"-1,000.00\",\"\",'1234567890',13245
cleared,07/28/1954,,\"XFER    TRANSFER\",\"OTHER DECREASE               Jul 28 06:33\",\"-1,000.00\",\"\",'1234567890',13245
cleared,07/27/1954,,\"GAS      DRAFT\",\"OTHER DECREASE               Jul 27 06:20\",\"-25.63\",\"\",'1234567890',13245
cleared,07/25/1954,03166,\"TRANSFERJul 25 12:55\",\"3166\",\"-328.00\",\"\",'1234567890',13245".
