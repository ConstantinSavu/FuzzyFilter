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
## @deftypefn {} {@var{retval} =} get_new_p (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Costi <Costi@DESKTOP-M4NJ8V0>
## Created: 2022-01-13

function new_p = get_new_p (g, m, v)

  ro = length(g);
  
  miu = zeros(1, ro);
  
  new_p = 0;
  
  for i = [1:ro]
    miu(i) = exp( (-1/2) * ( (g(i) - m) / v ) .^ 2 );  
  endfor
  
  W = 0;
  sum = 0;
  for i = [1:ro]
    miu(i) = exp( (-1/2) * ( (g(i) - m) / v ) .^ 2 );
    W += miu(i);
    sum += miu(i) * g(i);
  endfor
 
  new_p = sum / W;

endfunction
