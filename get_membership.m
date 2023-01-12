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
## @deftypefn {} {@var{retval} =} get_membership (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Costi <Costi@DESKTOP-M4NJ8V0>
## Created: 2022-01-13

function gauss_membership = get_membership (P, m1, m2, v)

  [n, m] = size(P);
  gauss_membership = zeros(n, m, 2);
  
  for i = [1:n]
    for j = [1:m]
      
        gauss_membership(i, j, 1) = exp((-1/2) * (((P(i, j) - m1))/v) .^ 2);
        gauss_membership(i, j, 2) = exp((-1/2) * (((P(i, j) - m2))/v) .^ 2);
      
    endfor
  endfor

endfunction
