////////////////////////////////////////////////////////////////////////////////
// AXI4-Stream interface
// Author: Iztok Jeras
// (c) Red Pitaya  http://www.redpitaya.com
////////////////////////////////////////////////////////////////////////////////

interface axi4_stream_if #(
  int unsigned DN = 1,
  type DAT_T = logic signed [8-1:0]
)(
  input  logic ACLK   ,  // clock
  input  logic ARESETn   // reset - active low
);

DAT_T [DN-1:0] TDATA ;  // data
logic [DN-1:0] TKEEP ;  // keep
logic          TLAST ;  // last
logic          TVALID;  // valid
logic          TREADY;  // ready

// source
modport s (
  input  ACLK   ,
  input  ARESETn,
  output TDATA ,
  output TKEEP ,
  output TLAST ,
  output TVALID,
  input  TREADY
);

// drain
modport d (
  input  ACLK   ,
  input  ARESETn,
  input  TDATA ,
  input  TKEEP ,
  input  TLAST ,
  input  TVALID,
  output TREADY
);

// monitor
modport m (
  input  ACLK   ,
  input  ARESETn,
  input  TDATA ,
  input  TKEEP ,
  input  TLAST ,
  input  TVALID,
  input  TREADY
);

endinterface: axi4_stream_if
