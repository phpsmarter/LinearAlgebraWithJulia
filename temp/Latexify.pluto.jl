### A Pluto.jl notebook ###
# v0.17.5

using Markdown
using InteractiveUtils

# ╔═╡ a283143a-f870-11ec-036e-2947d30c769c
begin
	using LaTeXStrings,Latexify
	Latexify.set_default(; starred=true)

	function latextify(ma)
	
	    return L"\begin{bmatrix} %$(ma[1,1])& %$(ma[1,2])& %$(ma[1,3])\\ 
	     %$(ma[2,1]) &  %$(ma[2,2])& %$(ma[2,3])\\ 
	     %$(ma[3,1]) & %$(ma[3,2])&  %$(ma[3,3])
	     \end{bmatrix}
	     "
	end

	function Axb(A,b)
		ma=A

	   return L"\begin{bmatrix} %$(ma[1,1])& %$(ma[1,2])& %$(ma[1,3])\\ 
	     %$(ma[2,1]) &  %$(ma[2,2])& %$(ma[2,3])\\ 
	     %$(ma[3,1]) & %$(ma[3,2])&  %$(ma[3,3])
	     \end{bmatrix}
	     \ast \begin{bmatrix}
	     x\\ 
         y\\ 
         z
         \end{bmatrix}=\begin{bmatrix}
            
	     %$(b[1])\\ 
         %$(b[2])\\ 
         %$(b[3])
        \end{bmatrix}"
     end
end

# ╔═╡ ff7b3574-4bc0-4230-988b-d6825d53049d
begin
	ma1=[1 2 3; 4 5 6; 7 8 9]
	ma2=[1 0 0; 0 1 0; 0 0 1]
	latexify(ma1)
	@show latexify(ma2)
end

# ╔═╡ c071b429-da8f-4ccb-981d-7d24533dcb88
let
	ma1=[1 2 3; 4 5 6; 7 8 9]
	b=[1,3,5]
	Axb(ma1,b)
	
end

# ╔═╡ eb51096b-5ffe-4380-afd4-1ff5c6cf23a9
let
       ma1=[1 2 3; 4 5 6; 7 8 9]
	   b=[1,3,5]
	
		function latexmatrix(ma)
		
		    return L"\begin{bmatrix} 
			 %$(ma[1,1])& %$(ma[1,2])& %$(ma[1,3])\\ 
		     %$(ma[2,1]) &  %$(ma[2,2])& %$(ma[2,3])\\ 
		     %$(ma[3,1]) & %$(ma[3,2])&  %$(ma[3,3])
		     \end{bmatrix}
		     "
	    end
	


	function latexvector(vec)
	    
	    return L"
	       \begin{bmatrix}
	            
		     %$(vec[1])\\ 
	         %$(vec[2])\\ 
	         %$(vec[3])
	        \end{bmatrix}"
	 end

	function axb(ma,b)
		ma= latexmatrix(ma)
		b=latexvector(b)
		return L"%$(ma) %$(b)"
	end

   axb(ma1,b)
	

end

# ╔═╡ 7ca0f5fc-5d40-4925-b381-654714f2ad6f
let
	ma1=[1 2 3; 4 5 6; 7 8 9]
	b=[1,3,5]
	function col_combination(A,b)
       ma=A
	   return L" x \ast \begin{bmatrix}
	         %$(ma[1,1]) \\ 
	         %$(ma[2,1]) \\ 
	         %$(ma[3,1])
	        \end{bmatrix}
	         +
	     y \ast \begin{bmatrix}
	         %$(ma[1,2]) \\ 
	         %$(ma[2,2]) \\ 
	         %$(ma[3,2])
	        \end{bmatrix} +
	     z \ast \begin{bmatrix}
	         %$(ma[1,3]) \\ 
	         %$(ma[2,3]) \\ 
	         %$(ma[3,3])
	        \end{bmatrix}"
	end
    
 col_combination(ma1,b)
end

# ╔═╡ 569a5b49-bd2a-439d-ac78-98a9139df2de
let
	ma1=[1 2 3; 4 5 6; 7 8 9]
	b=[1,3,3]
	latexify(ma1*b)
	
end

# ╔═╡ a9313bc4-f380-41db-8616-a3ee62afecfe
let
	e1=[1 0 0;-2 1 0; 0 0 1]
	r1,r2,r3=[1 0 0],[0 1 0],[0 0 1]
	ma=[r1;r2;r3]
	p12=[r2;r1;r3 ]
	p23=[r1;r3;r2]
	p13=[r3;r2;r1 ]
	b=[2,8,10]
	@show  ma
	# latexify(e1*b)
	# latexify(p23*b)
	# latexify(p12*b)
	
end

# ╔═╡ 730d0949-251c-45a1-87b1-7be34818bbe7
let
	A=[3 4;1 5; 2 0]
	B=[2 4;1 1]
	res=A*B
end

# ╔═╡ 0c47dce0-a068-4a47-8753-03f2e047b6bd
begin
        store=Dict()
    
        function save(key::String, dict)
            store[key]=dict
        end
        
        function read(key::String)
            return  store[key]
        end
    end


# ╔═╡ cc5f7094-2b72-4774-81c3-33c398d57db6
let
  r1,r2=[1 0],[0 1]
  I=[r1;r2]
  A=[I I I;I I I]
  res1=latexify(A)
  save("blockmatrix",res1)
end

# ╔═╡ 4b1d2952-d48a-4c62-b9cd-753a987af7c9
let
  r1,r2=[1 0],[0 1]
  I=[r1;r2]
(store["blockmatrix"])

end

# ╔═╡ f19c9b4b-3d9a-4031-9c39-e84805708eb2
let
    ma1=[1 2 3; 4 5 6; 7 8 9]
	b=[1,3,5]
	x=[3,4,5]
	function col_combination(A,b;x=["x","y","z"])
       ma=A
       b1,b2,b3=b[1],b[2],b[3]
	   x,y,z=x[1],x[2],x[3]
	   return L" 
	   \begin{bmatrix} %$(ma[1,1])& %$(ma[1,2])& %$(ma[1,3])\\ 
	     %$(ma[2,1]) &  %$(ma[2,2])& %$(ma[2,3])\\ 
	     %$(ma[3,1]) & %$(ma[3,2])&  %$(ma[3,3])
	     \end{bmatrix}
	     
	      \ast \begin{bmatrix}
	     %$(x)\\ 
         %$(y)\\ 
         %$(z)
         \end{bmatrix}
         
         =
	   
	    %$(x) \ast \begin{bmatrix}
	         %$(ma[1,1]) \\ 
	         %$(ma[2,1]) \\ 
	         %$(ma[3,1])
	        \end{bmatrix}
	         +
	      %$(y)\ast \begin{bmatrix}
	         %$(ma[1,2]) \\ 
	         %$(ma[2,2]) \\ 
	         %$(ma[3,2])
	        \end{bmatrix} +
	      %$(z) \ast \begin{bmatrix}
	         %$(ma[1,3]) \\ 
	         %$(ma[2,3]) \\ 
	         %$(ma[3,3])
	        \end{bmatrix}
	        
	        =
	        
	        \begin{bmatrix}
	         %$(b1) \\ 
	         %$(b2) \\ 
	         %$(b3)
	        \end{bmatrix}

	        "
	end

  colcomb=col_combination
  colcomb(ma1,b)
end

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
LaTeXStrings = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
Latexify = "23fbe1c1-3f47-55db-b15f-69d7ec21a316"

[compat]
LaTeXStrings = "~1.3.0"
Latexify = "~0.15.15"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.1"
manifest_format = "2.0"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.Formatting]]
deps = ["Printf"]
git-tree-sha1 = "8339d61043228fdd3eb658d86c926cb282ae72a8"
uuid = "59287772-0a20-5a39-b81b-1366585eb4c0"
version = "0.4.2"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.LaTeXStrings]]
git-tree-sha1 = "f2355693d6778a178ade15952b7ac47a4ff97996"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.3.0"

[[deps.Latexify]]
deps = ["Formatting", "InteractiveUtils", "LaTeXStrings", "MacroTools", "Markdown", "Printf", "Requires"]
git-tree-sha1 = "46a39b9c58749eefb5f2dc1178cb8fab5332b1ab"
uuid = "23fbe1c1-3f47-55db-b15f-69d7ec21a316"
version = "0.15.15"

[[deps.MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "3d3e902b31198a27340d0bf00d6ac452866021cf"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.9"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "838a3a4188e2ded87a4f9f184b4b0d78a1e91cb7"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.0"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
"""

# ╔═╡ Cell order:
# ╠═a283143a-f870-11ec-036e-2947d30c769c
# ╠═ff7b3574-4bc0-4230-988b-d6825d53049d
# ╠═c071b429-da8f-4ccb-981d-7d24533dcb88
# ╠═eb51096b-5ffe-4380-afd4-1ff5c6cf23a9
# ╠═7ca0f5fc-5d40-4925-b381-654714f2ad6f
# ╠═569a5b49-bd2a-439d-ac78-98a9139df2de
# ╠═a9313bc4-f380-41db-8616-a3ee62afecfe
# ╠═730d0949-251c-45a1-87b1-7be34818bbe7
# ╠═cc5f7094-2b72-4774-81c3-33c398d57db6
# ╠═4b1d2952-d48a-4c62-b9cd-753a987af7c9
# ╠═0c47dce0-a068-4a47-8753-03f2e047b6bd
# ╠═f19c9b4b-3d9a-4031-9c39-e84805708eb2
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
