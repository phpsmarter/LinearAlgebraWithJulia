### A Pluto.jl notebook ###
# v0.17.5

using Markdown
using InteractiveUtils

# ╔═╡ 81fe43a8-0241-11ed-11f3-f746f0156d42
begin
	using Plots, PlutoUI,HypertextLiteral,LaTeXStrings,Symbolics,LinearAlgebra,RowEchelon,Latexify,Roots
	gr()
        theme(:bright)
        @htl("""<script src="https://cdn.bootcdn.net/ajax/libs/mathjax/3.2.0/es5/tex-svg-full.min.js"></script>
        """)
        PlutoUI.TableOfContents()
	
end

# ╔═╡ 2bb7f735-e1e6-4652-9482-bc43b957fe56
let
	using LinearSolve
	@variables x, y, z
	eq1=2x+4y-2z~2
	eq2=4x+9y-3z~8
	eq3=-2x-3y+7z~10
end

# ╔═╡ 32e2edef-9101-4d48-8c31-7467bbab86d5
let
	A=[0.95 0.03;0.05 0.97]
	x0=[0.6,0.4]
	eigenvalue, eignvecs=eigvals(A),eigvecs(A)
	D=diagm(eigenvalue)
	P=eignvecs
	P⁻¹=inv(P)

	P*D*P⁻¹
	
end

# ╔═╡ 189930b6-1b24-4e16-a055-cda4e556d191
let
	@variables A,λ,I
	A=[1 3; 7 9]
	I=diagm([1,1])
	A-λ*I
	chp=det(A-λ*I)
	latexify(chp~0)
end

# ╔═╡ 83d09b80-4ddc-4493-8660-09938e1c3017
let
	m(x, y) =  x*y
    @register m(x, y)
	@variables d₁, d₂, k,c₁,c₂
	D=diagm([d₁,d₂])
	C=diagm([c₁,c₂])
	
	
    substitute(D, (Dict(d₁ =>5,d₂=>3)))
	
	m(D,C)
end

# ╔═╡ b6cad911-22de-4540-ab39-75dd987959d4
let
	A=[0.5 -0.6;0.75 1.1]
    #eigenvalue, eignvecs=eigvals(A),eigvecs(A)
    v=[2,0]
	arr=[]
	
   function 	f(n)
	    return n==1 ? A*v : A*f(n-1)
   end

  res1=[f(n) for n in 1:10]
  res2=[f(n) for n in 1:100]
  xs,ys=[],[]
  xs2,ys2=[],[]

 for item in res1
	 push!(xs,item[1])
	 push!(ys,item[2])
 end

for item in res2
	 push!(xs2,item[1])
	 push!(ys2,item[2])
 end

  scatter(xs, ys,label=false ,frame=:origin,size=(300,300))
  scatter!(xs2, ys2,ms=2, mc=:red,label=false)

	
end

# ╔═╡ ff3ba688-ddd6-4358-987b-fb8367c1cd18
let
	A=[
		1 0 0;
		1 1 0;
		1 1 1;
		1 1 1;
	]

	Q,R=qr(A)

	r1,r2,r3=Q[:,1],Q[:,2],Q[:,3]

	res=dot(r2,r3)
end

# ╔═╡ 217c20fb-4e96-40b1-b584-df4364853b69
let
	A=[3 -2 4 ;
	   -2 6 2 ;
	   4 2 3
	]

	eigenvalue, eignvecs=eigvals(A),eigvecs(A)

end

# ╔═╡ 53c18e52-6e50-4873-b8c1-1cf22c9df4e1
let
	@variables x,x₁,x₂,A1,A2
	A1=[
		4 0 ;
		0 3
	]

	A2=[3 -2 ;
	     -2 7
	]
	x=[x₁,x₂]

	qu1=x'*A1*x
	qu2=x'*A2*x
	expand(qu2)
end

# ╔═╡ 18336bb2-1465-4466-b33d-47385b5dd07e
let
	A=[4 11 14;8 7 -2]
	n = 100 ÷ 4 # 2048
    θ = LinRange(0, π, n)
    φ = LinRange(0, 2π, 2 * n)
    x = [cos(φ) * sin(θ) for θ in θ for φ in φ]
    y = [sin(φ) * sin(θ) for θ in θ for φ in φ]
    z = [cos(θ) for θ in θ for φ in φ]

    ma=[x';y';z']
	ma2=A*ma

	p1=plot(ma[1,:],ma[2,:],ma[3,:],label=false)

	p2=plot(ma2[1,:],ma2[2,:],label=false)

	plot!(p1,p2,layout=(1,2))
end

# ╔═╡ 6adc131c-74fa-4a59-9d95-71e1f71700ac
let
	A=[0.5 0; 0 1]
    tspan=-4:0.02:4
	xs=[cos(t) for t in tspan]
	ys=[sin(t) for t in tspan]
	ma=[xs';ys']
	ma2=A*ma
	p1=plot(xs, ys,size=(300,300),label="circle",frame=:zerolines)
	p2=plot(ma2[1,:],ma2[2,:],label="egg",size=(300,300),frame=:zerolines)
	plot!(p1,p2, layout=(1,2),link=:all,size=(600,300),frame=:semi)

	
	
end

# ╔═╡ 4fdd5ffc-0fe1-479b-a2fd-33d162b5713a
let
	@variables c,d V1,V2,b,x
    V1,V2,b=[2,-1],[-1,2],[1,0]
	ma=hcat(V1,V2)
    x=[c d]
    res=c*V1+d*V2~b
	res2=ma*x'
	
end

# ╔═╡ b0669a0e-eeb3-453f-b6fc-92857943624f
begin
       function vec_plot3d(v1,v2,ls=:solid)
			v11,v12,v13=v1[1],v1[2],v1[3]
			v21,v22,v23=v2[1],v2[2],v2[3]
			return plot([v11,v21],[v12,v22],[v13,v23],label=false, lw=1,ls=ls)
		end

	    function vec_plot3d!(v1,v2,ls=:solid)
			v11,v12,v13=v1[1],v1[2],v1[3]
			v21,v22,v23=v2[1],v2[2],v2[3]
			return plot!([v11,v21],[v12,v22],[v13,v23],label=false, lw=1,ls=ls)
		end

end

# ╔═╡ 76896ad1-e2cc-43df-ba70-8e4bae98a258
let
p1,p2,zero=[1 2 3],[3 6 9],[0 0 0]

 plot1=vec_plot3d(zero,p1)
 plot2=vec_plot3d!(zero,p2)
	

end

# ╔═╡ 8fff64d4-980f-49e9-836d-1ab28e68d180
let
p1,p2,zero=[1 0 0],[0 2 3],[0 0 0]

 plot1=vec_plot3d(zero,p1)
 plot2=vec_plot3d!(zero,p2)
	

end

# ╔═╡ 061b0d7b-bbeb-4c97-bef5-937cf126d147
let
p1,p2,p3,zero=[2 0 0],[0 2 2],[2 2 3],[0 0 0]

 plot1=vec_plot3d(zero,p1)
 plot2=vec_plot3d!(zero,p2)
 plot2=vec_plot3d!(zero,p3)
	

end

# ╔═╡ e96df37a-ecae-4212-801f-b2b5c3108e40
begin
	@variables A,B,C,c
    A+B~B+A
end

# ╔═╡ 9bbd4307-f82c-4ca1-be36-2f5329089caa
c*(A+B)~expand(c*(A+B))

# ╔═╡ 54e3db68-225f-4a92-9c58-206828de858a
(A+B)*C~expand((A+B)*C)

# ╔═╡ 207db64c-ec57-4e3e-b735-2dc5ab58c1be
A*(B*C)

# ╔═╡ 8701b7b3-8b8f-4c18-a6f8-1d6eefb1cbe2
let
	@variables I,A
	I=diagm([1,1])
	A=[I I; I I ]
	latexify(A)
	
end

# ╔═╡ 4ff479ad-2283-4b8b-a560-5b25d86f78d9
let
	@variables A,B
	A,B=[1 0 ; 0 1],[2 3; 3 4 ]
	# (A*B)'~B'*A'
	# (A+B)'~A'+B'
	A*A^-1~A^-1*A
end

# ╔═╡ 263f8fdd-d41b-44b3-8450-cd6732535dd1
let
	
	A=[1 2 ; 2  7 ]
    svd(A)
end

# ╔═╡ 87280d8c-108a-42fb-9d13-dcc2aa87d0b0
begin
	@variables  u, v ,w, p, q

	R=[1  0 u 0 w;
	   0  1 v 0 p;
	   0  0 0 1 q;
	   0  0 0 0  0
	]

   c1=R[:,1]
   c2=R[:,2]
   c3=R[:,3]
   D=u*c1+v*c2~c3
   latexify(D)
   V = substitute(D, (Dict(u=>2,v=>4)),)
   latexify(V)

   
	
 
end

# ╔═╡ cf0c6697-44f6-40e8-aaf4-e79b19f5fe57
let
	
	A=[1 1 2 4;
	   1 2 2 5;
	   1 3 2 6
	]

	rA=rref(A)
	latexify(rA)
end

# ╔═╡ b3bde625-233a-47c9-8da7-2ea70651bb03
let
	
	A=[1 3 10;
	   2 6 20;
	   3 9 30
	]

	rA=rref(A)
	latexify(rA)
end

# ╔═╡ d04eb7b3-4197-48cc-9b8d-5485a0f4fc0d
let  
	@variables b1, b2, b3
	A=[1 3 0 2 ;
	   0 0 1 4 ;
	   1 3 1 6 
	]
	b=[b1  b2  b3]'

	Ab=hcat(A,b)
	r1=Ab[1,:]
	r2=Ab[2,:]
	r3=Ab[3,:]
	r3=r3-r1-r2
    latexify([r1';r2';r3'])
end

# ╔═╡ a571215a-8cf6-4e84-bc73-6e355838f8bf
let
	@variables  u₀,A
	
	A,u₀=[1 1; 1 0],[1,0]

	u1=A*u₀
	u2=A*u1
  λ1,λ2=eigvals(A)
  x1,x2=eigvecs(A)

  u(k)= ((λ1)^k*x1-(λ2)^k*x2)/(λ1-λ2)

  u(100)
	
    end

# ╔═╡ cf210446-a2d6-427d-8dfd-0f34632f08f6
let
  @variables  col,row, matrix,a, c ,e

	col=[1, 1, 1 ,1 ,1 ,1 ]
	row=[a a  c  c  e  e ]
	

	matrix=col*row
	latexify(matrix)
end

# ╔═╡ 95eb616a-8415-4d99-9647-c9b78a330ff6
let
	@variables  x, y, z
	latexequation(2x+3y)

	ex = :(x/(y+x)^2)
    latexify(ex)
end

# ╔═╡ b554afd6-30ea-4cee-8986-4648180aaa3d
begin
	function lorenz!(du,u,p,t)
		x,y,z=du
	    σ,ρ,β = p
	    du[1] = σ*(y-x)
	    du[2] = x*(ρ-z) - y
	    du[3] = x*y - β*z
    end

end

# ╔═╡ 4497fd69-06a6-4ae0-a68d-19f84a134037
let
	@variables x, y, z
	
	eqs = [2x+4y-2z~2,
           4x+9y-3z~8,
           -2x-3y+7z~10]

	Symbolics.jacobian(eqs,[x,y,z])
end

# ╔═╡ b9e2418f-d411-4416-b4c1-bda518a2a633
let
	@variables x, y,z
	Symbolics.jacobian( [2x+4y-2z,
           4x+9y-3z,
           -2x-3y+7z],[x, y,z])
end

# ╔═╡ 64e694ff-337b-4e3b-8473-37e969d720a3
let
	@variables x,W, e

	W=[e^x e^(2x)  e^(3x);
	
	   e^x  2*e^(2x)  3*e^(3x);
		
	   e^x  4*e^(2x)  9*e^(3x);
	]

	res=det(W)
	simplify(res)

end

# ╔═╡ Cell order:
# ╠═81fe43a8-0241-11ed-11f3-f746f0156d42
# ╠═32e2edef-9101-4d48-8c31-7467bbab86d5
# ╠═189930b6-1b24-4e16-a055-cda4e556d191
# ╠═83d09b80-4ddc-4493-8660-09938e1c3017
# ╠═b6cad911-22de-4540-ab39-75dd987959d4
# ╠═ff3ba688-ddd6-4358-987b-fb8367c1cd18
# ╠═217c20fb-4e96-40b1-b584-df4364853b69
# ╠═53c18e52-6e50-4873-b8c1-1cf22c9df4e1
# ╠═18336bb2-1465-4466-b33d-47385b5dd07e
# ╠═6adc131c-74fa-4a59-9d95-71e1f71700ac
# ╠═4fdd5ffc-0fe1-479b-a2fd-33d162b5713a
# ╠═76896ad1-e2cc-43df-ba70-8e4bae98a258
# ╠═8fff64d4-980f-49e9-836d-1ab28e68d180
# ╠═061b0d7b-bbeb-4c97-bef5-937cf126d147
# ╠═b0669a0e-eeb3-453f-b6fc-92857943624f
# ╠═2bb7f735-e1e6-4652-9482-bc43b957fe56
# ╠═e96df37a-ecae-4212-801f-b2b5c3108e40
# ╠═9bbd4307-f82c-4ca1-be36-2f5329089caa
# ╠═54e3db68-225f-4a92-9c58-206828de858a
# ╠═207db64c-ec57-4e3e-b735-2dc5ab58c1be
# ╠═8701b7b3-8b8f-4c18-a6f8-1d6eefb1cbe2
# ╠═4ff479ad-2283-4b8b-a560-5b25d86f78d9
# ╠═263f8fdd-d41b-44b3-8450-cd6732535dd1
# ╠═87280d8c-108a-42fb-9d13-dcc2aa87d0b0
# ╠═cf0c6697-44f6-40e8-aaf4-e79b19f5fe57
# ╠═b3bde625-233a-47c9-8da7-2ea70651bb03
# ╠═d04eb7b3-4197-48cc-9b8d-5485a0f4fc0d
# ╠═a571215a-8cf6-4e84-bc73-6e355838f8bf
# ╠═cf210446-a2d6-427d-8dfd-0f34632f08f6
# ╠═95eb616a-8415-4d99-9647-c9b78a330ff6
# ╠═b554afd6-30ea-4cee-8986-4648180aaa3d
# ╠═4497fd69-06a6-4ae0-a68d-19f84a134037
# ╠═b9e2418f-d411-4416-b4c1-bda518a2a633
# ╠═64e694ff-337b-4e3b-8473-37e969d720a3
