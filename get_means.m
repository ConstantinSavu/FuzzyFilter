## Copyright (C) 2022 Costi
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} get_means (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Costi <Costi@DESKTOP-M4NJ8V0>
## Created: 2022-01-13

function [m1, m2, v] = get_means (P, s)

  P = P';
  P_vect = P(:);
  
  N = length(P_vect);
  h = (N - 1) / 2;
  
  m1_vect = P_vect(1:h);
  m2_vect = P_vect(h+2:N);
  
  m1 = 2 * sum(m1_vect) / (N - 1);
  m2 = 2 * sum(m2_vect) / (N - 1);
  
  v_avg = 0.5 * (m1 + m2);
  sum_v = 0;
  for i = [1:N]
    sum_v += s * abs(P_vect(i) - v_avg);
  endfor
  
  v = sum_v / N;
  
  
endfunction
