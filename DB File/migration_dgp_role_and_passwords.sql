-- Migration: rename role NCO -> DGP and reset default passwords to <staffid>@Dgl2026 (SHA1, as used by logincheck.php)
USE dindigulpolice;
UPDATE userlogin SET status = 'DGP' WHERE status = 'NCO';
UPDATE userlogin SET password = '8200cffe614c724f9be4ef3116dcd665c35ff6d0' WHERE staffid = '100';
UPDATE userlogin SET password = '22a9a3e7ac3d8e83fa23b904e24075954e8edea2' WHERE staffid = '101';
UPDATE userlogin SET password = 'bfe3717a25ec12409245bdc87acdec7c14f7f556' WHERE staffid = '110';
UPDATE userlogin SET password = '6c4c154b5c2a941365102cb59239ebb60f34734e' WHERE staffid = '113';
UPDATE userlogin SET password = '1d34439b0c9916222f2d6555791ef9f4fd36ea82' WHERE staffid = '114';
UPDATE userlogin SET password = 'b988ea286006bbe8d569568bab58edb20fa932e7' WHERE staffid = '115';
UPDATE userlogin SET password = '913af5073c78738f122fc557c95cf083c8ada99e' WHERE staffid = '116';
UPDATE userlogin SET password = '9d209f343c090914a64b31fd8637a9cd74a1b0c2' WHERE staffid = '117';
