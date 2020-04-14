@testset "Costs" begin
    @test LearnBase.Cost <: Any
    @test LearnBase.Penalty <: LearnBase.Cost
    @test LearnBase.Loss <: LearnBase.Cost
    @test LearnBase.UnsupervisedLoss <: LearnBase.Loss
    @test LearnBase.SupervisedLoss <: LearnBase.Loss
    @test LearnBase.UnarySupervisedLoss <: LearnBase.SupervisedLoss
    @test LearnBase.MarginLoss <: LearnBase.UnarySupervisedLoss
    @test LearnBase.DistanceLoss <: LearnBase.UnarySupervisedLoss

    @test typeof(LearnBase.value) <: Function
    @test typeof(LearnBase.value!) <: Function
    @test typeof(LearnBase.deriv) <: Function
    @test typeof(LearnBase.deriv!) <: Function
    @test typeof(LearnBase.deriv2) <: Function
    @test typeof(LearnBase.deriv2!) <: Function
    @test typeof(LearnBase.value_deriv) <: Function
    @test typeof(LearnBase.value_deriv!) <: Function

    @test typeof(LearnBase.isminimizable) <: Function
    @test typeof(LearnBase.isdifferentiable) <: Function
    @test typeof(LearnBase.istwicedifferentiable) <: Function
    @test typeof(LearnBase.isconvex) <: Function
    @test typeof(LearnBase.isstrictlyconvex) <: Function
    @test typeof(LearnBase.isstronglyconvex) <: Function
    @test typeof(LearnBase.isnemitski) <: Function
    @test typeof(LearnBase.islipschitzcont) <: Function
    @test typeof(LearnBase.islocallylipschitzcont) <: Function
    @test typeof(LearnBase.isclipable) <: Function
    @test typeof(LearnBase.ismarginbased) <: Function
    @test typeof(LearnBase.isclasscalibrated) <: Function
    @test typeof(LearnBase.isdistancebased) <: Function
    @test typeof(LearnBase.issymmetric) <: Function

    # test fallback methods
    struct MyStronglyConvexType end
    LearnBase.isstronglyconvex(::MyStronglyConvexType) = true
    LearnBase.islipschitzcont(::MyStronglyConvexType) = true
    @test LearnBase.isstronglyconvex(MyStronglyConvexType())
    @test LearnBase.isstrictlyconvex(MyStronglyConvexType())
    @test LearnBase.isconvex(MyStronglyConvexType())
    @test LearnBase.islipschitzcont(MyStronglyConvexType())
    @test LearnBase.islocallylipschitzcont(MyStronglyConvexType())
end
