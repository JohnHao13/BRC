`timescale 1ns/1ps

module BRC_tb;

  // DUT inputs
  logic [31:0] i_rs1_data;
  logic [31:0] i_rs2_data;
  logic i_br_un;

  // DUT outputs
  logic o_br_less;
  logic o_br_equal;

  // Instantiate DUT
  BRC dut (
    .i_rs1_data(i_rs1_data),
    .i_rs2_data(i_rs2_data),
    .i_br_un(i_br_un),
    .o_br_less(o_br_less),
    .o_br_equal(o_br_equal)
  );

  // Task for applying testcases
  task run_case(input logic [31:0] a, b, input logic mode);
    begin
      i_rs1_data = a;
      i_rs2_data = b;
      i_br_un    = mode;
      #1; // wait for combinational logic to settle
      $display("Mode=%0s | A=%0d, B=%0d | less=%b, equal=%b",
               (mode ? "signed" : "unsigned"), 
               a, b, o_br_less, o_br_equal);
    end
  endtask

  initial begin
    $display("==== BRC Testbench Start ====");

    // unsigned mode (i_br_un=0)
    run_case(32'hfffffff8, 32'hfffffff4, 0);
    run_case(32'd10, 32'd5, 0);
    run_case(32'd15, 32'd15, 0);

    // signed mode (i_br_un=1)
    run_case(32'd5, 32'd10, 1);
    run_case(-32'd5, 32'd3, 1);
    run_case(-32'd147, -32'd126, 1);
    run_case(-32'd7, -32'd7, 1);

    $display("==== BRC Testbench Done ====");
    $finish;
  end

endmodule
