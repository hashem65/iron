!> \file
!> \author Chris Bradley
!> \brief This module contains all equations mapping access method routines.
!>
!> \section LICENSE
!>
!> Version: MPL 1.1/GPL 2.0/LGPL 2.1
!>
!> The contents of this file are subject to the Mozilla Public License
!> Version 1.1 (the "License"); you may not use this file except in
!> compliance with the License. You may obtain a copy of the License at
!> http://www.mozilla.org/MPL/
!>
!> Software distributed under the License is distributed on an "AS IS"
!> basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
!> License for the specific language governing rights and limitations
!> under the License.
!>
!> The Original Code is OpenCMISS
!>
!> The Initial Developer of the Original Code is University of Auckland,
!> Auckland, New Zealand, the University of Oxford, Oxford, United
!> Kingdom and King's College, London, United Kingdom. Portions created
!> by the University of Auckland, the University of Oxford and King's
!> College, London are Copyright (C) 2007-2010 by the University of
!> Auckland, the University of Oxford and King's College, London.
!> All Rights Reserved.
!>
!> Contributor(s): Chris Bradley
!>
!> Alternatively, the contents of this file may be used under the terms of
!> either the GNU General Public License Version 2 or later (the "GPL"), or
!> the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),
!> in which case the provisions of the GPL or the LGPL are applicable instead
!> of those above. If you wish to allow use of your version of this file only
!> under the terms of either the GPL or the LGPL, and not to allow others to
!> use your version of this file under the terms of the MPL, indicate your
!> decision by deleting the provisions above and replace them with the notice
!> and other provisions required by the GPL or the LGPL. If you do not delete
!> the provisions above, a recipient may use your version of this file under
!> the terms of any one of the MPL, the GPL or the LGPL.
!>

!> This module contains all equations mapping access method routines.
MODULE EquationsMappingAccessRoutines
  
  USE BASE_ROUTINES
  USE Kinds
  USE Strings
  USE Types

#include "macros.h"  

  IMPLICIT NONE

  PRIVATE

  !Module parameters

  !Module types

  !Module variables

  !Interfaces

  PUBLIC EquationsMappingScalar_CreateValuesCacheGet

  PUBLIC EquationsMappingScalar_EquationsScalarGet

  PUBLIC EquationsMappingVector_CreateValuesCacheGet

  PUBLIC EquationsMappingVector_DynamicMappingGet
  
  PUBLIC EquationsMappingVector_EquationsVectorGet

  PUBLIC EquationsMappingVector_LinearMappingGet
  
  PUBLIC EquationsMappingVector_NonlinearMappingGet
  
  PUBLIC EquationsMappingVector_RHSMappingGet
  
  PUBLIC EquationsMappingVector_SourceMappingGet
CONTAINS

  !
  !================================================================================================================================
  !

  !>Gets the create values cache for an scalar equations mapping.
  SUBROUTINE EquationsMappingScalar_CreateValuesCacheGet(scalarMapping,createValuesCache,err,error,*)

    !Argument variables
    TYPE(EquationsMappingScalarType), POINTER :: scalarMapping !<A pointer to the equations scalar mapping to get the create values cache for
    TYPE(EquationsMappingScalarCreateValuesCacheType), POINTER :: createValuesCache !<On exit, a pointer to the create values cache in the specified scalar equations mapping. Must not be associated on entry
    INTEGER(INTG), INTENT(OUT) :: err !<The error code
    TYPE(VARYING_STRING), INTENT(OUT) :: error !<The error string
    !Local Variables
    TYPE(VARYING_STRING) :: localError
 
    ENTERS("EquationsMappingScalar_CreateValuesCacheGet",err,error,*998)

    IF(ASSOCIATED(createValuesCache)) CALL FlagError("Create values cache is already associated.",err,error,*998)
    IF(.NOT.ASSOCIATED(scalarMapping)) CALL FlagError("Scalar mapping is not associated.",err,error,*999)

    createValuesCache=>scalarMapping%createValuesCache
    IF(.NOT.ASSOCIATED(createValuesCache)) &
      & CALL FlagError("Create values cache is not associated for the scalar mapping.",err,error,*999)
       
    EXITS("EquationsMappingScalar_CreateValuesCacheGet")
    RETURN
999 NULLIFY(createValuesCache)
998 ERRORSEXITS("EquationsMappingScalar_CreateValuesCacheGet",err,error)
    RETURN 1
    
  END SUBROUTINE EquationsMappingScalar_CreateValuesCacheGet

  !
  !================================================================================================================================
  !

  !>Gets the scalar equations for an scalar equations mapping.
  SUBROUTINE EquationsMappingScalar_EquationsScalarGet(scalarMapping,scalarEquations,err,error,*)

    !Argument variables
    TYPE(EquationsMappingScalarType), POINTER :: scalarMapping !<A pointer to the equations scalar mapping to get the scalar equations for
    TYPE(EquationsScalarType), POINTER :: scalarEquations !<On exit, a pointer to the scalar equations in the specified scalar equations mapping. Must not be associated on entry
    INTEGER(INTG), INTENT(OUT) :: err !<The error code
    TYPE(VARYING_STRING), INTENT(OUT) :: error !<The error string
    !Local Variables
    TYPE(VARYING_STRING) :: localError
 
    ENTERS("EquationsMappingScalar_EquationsScalarGet",err,error,*998)

    IF(ASSOCIATED(scalarEquations)) CALL FlagError("Scalar equations is already associated.",err,error,*998)
    IF(.NOT.ASSOCIATED(scalarMapping)) CALL FlagError("Scalar mapping is not associated.",err,error,*999)

    scalarEquations=>scalarMapping%scalarEquations
    IF(.NOT.ASSOCIATED(scalarEquations)) CALL FlagError("Scalar equations is not associated for the scalar mapping.",err,error,*999)
       
    EXITS("EquationsMappingScalar_EquationsScalarGet")
    RETURN
999 NULLIFY(scalarEquations)
998 ERRORSEXITS("EquationsMappingScalar_EquationsScalarGet",err,error)
    RETURN 1
    
  END SUBROUTINE EquationsMappingScalar_EquationsScalarGet

  !
  !================================================================================================================================
  !

  !>Gets the create values cache for an vector equations mapping.
  SUBROUTINE EquationsMappingVector_CreateValuesCacheGet(vectorMapping,createValuesCache,err,error,*)

    !Argument variables
    TYPE(EquationsMappingVectorType), POINTER :: vectorMapping !<A pointer to the equations vector mapping to get the create values cache for
    TYPE(EquationsMappingVectorCreateValuesCacheType), POINTER :: createValuesCache !<On exit, a pointer to the create values cache in the specified vector equations mapping. Must not be associated on entry
    INTEGER(INTG), INTENT(OUT) :: err !<The error code
    TYPE(VARYING_STRING), INTENT(OUT) :: error !<The error string
    !Local Variables
    TYPE(VARYING_STRING) :: localError
 
    ENTERS("EquationsMappingVector_CreateValuesCacheGet",err,error,*998)

    IF(ASSOCIATED(createValuesCache)) CALL FlagError("Create values cache is already associated.",err,error,*998)
    IF(.NOT.ASSOCIATED(vectorMapping)) CALL FlagError("Vector mapping is not associated.",err,error,*999)

    createValuesCache=>vectorMapping%createValuesCache
    IF(.NOT.ASSOCIATED(createValuesCache)) &
      & CALL FlagError("Create values cache is not associated for the vector mapping.",err,error,*999)
       
    EXITS("EquationsMappingVector_CreateValuesCacheGet")
    RETURN
999 NULLIFY(createValuesCache)
998 ERRORSEXITS("EquationsMappingVector_CreateValuesCacheGet",err,error)
    RETURN 1
    
  END SUBROUTINE EquationsMappingVector_CreateValuesCacheGet

  !
  !================================================================================================================================
  !

  !>Gets the dynamic vector mapping for an vector mapping.
  SUBROUTINE EquationsMappingVector_DynamicMappingGet(vectorMapping,dynamicMapping,err,error,*)

    !Argument variables
    TYPE(EquationsMappingVectorType), POINTER :: vectorMapping !<A pointer to the equations vector mapping to get the dynamic mapping for
    TYPE(EquationsMappingDynamicType), POINTER :: dynamicMapping !<On exit, a pointer to the dynamic Mapping in the specified vector equations mapping. Must not be associated on entry
    INTEGER(INTG), INTENT(OUT) :: err !<The error code
    TYPE(VARYING_STRING), INTENT(OUT) :: error !<The error string
    !Local Variables
 
    ENTERS("EquationsMappingVector_DynamicMappingGet",err,error,*998)

    IF(ASSOCIATED(dynamicMapping)) CALL FlagError("Dynamic mapping is already associated.",err,error,*998)
    IF(.NOT.ASSOCIATED(vectorMapping)) CALL FlagError("Vector mapping is not associated.",err,error,*999)

    dynamicMapping=>vectorMapping%dynamicMapping
    IF(.NOT.ASSOCIATED(dynamicMapping)) CALL FlagError("Dynamic mapping is not associated for the vector mapping.",err,error,*999)
       
    EXITS("EquationsMappingVector_DynamicMappingGet")
    RETURN
999 NULLIFY(dynamicMapping)
998 ERRORSEXITS("EquationsMappingVector_DynamicMappingGet",err,error)
    RETURN 1
    
  END SUBROUTINE EquationsMappingVector_DynamicMappingGet

  !
  !================================================================================================================================
  !

  !>Gets the vector equations for an vector equations mapping.
  SUBROUTINE EquationsMappingVector_EquationsVectorGet(vectorMapping,vectorEquations,err,error,*)

    !Argument variables
    TYPE(EquationsMappingVectorType), POINTER :: vectorMapping !<A pointer to the equations vector mapping to get the vector equations for
    TYPE(EquationsVectorType), POINTER :: vectorEquations !<On exit, a pointer to the vector equations in the specified vector equations mapping. Must not be associated on entry
    INTEGER(INTG), INTENT(OUT) :: err !<The error code
    TYPE(VARYING_STRING), INTENT(OUT) :: error !<The error string
    !Local Variables
 
    ENTERS("EquationsMappingVector_EquationsVectorGet",err,error,*998)

    IF(ASSOCIATED(vectorEquations)) CALL FlagError("Vector equations is already associated.",err,error,*998)
    IF(.NOT.ASSOCIATED(vectorMapping)) CALL FlagError("Vector mapping is not associated.",err,error,*999)

    vectorEquations=>vectorMapping%vectorEquations
    IF(.NOT.ASSOCIATED(vectorEquations)) CALL FlagError("Vector equations is not associated for the vector mapping.",err,error,*999)
       
    EXITS("EquationsMappingVector_EquationsVectorGet")
    RETURN
999 NULLIFY(vectorEquations)
998 ERRORSEXITS("EquationsMappingVector_EquationsVectorGet",err,error)
    RETURN 1
    
  END SUBROUTINE EquationsMappingVector_EquationsVectorGet

  !
  !================================================================================================================================
  !

  !>Gets the linear vector mapping for an vector mapping.
  SUBROUTINE EquationsMappingVector_LinearMappingGet(vectorMapping,linearMapping,err,error,*)

    !Argument variables
    TYPE(EquationsMappingVectorType), POINTER :: vectorMapping !<A pointer to the equations vector mapping to get the linear mapping for
    TYPE(EquationsMappingLinearType), POINTER :: linearMapping !<On exit, a pointer to the linear Mapping in the specified vector equations mapping. Must not be associated on entry
    INTEGER(INTG), INTENT(OUT) :: err !<The error code
    TYPE(VARYING_STRING), INTENT(OUT) :: error !<The error string
    !Local Variables
 
    ENTERS("EquationsMappingVector_LinearMappingGet",err,error,*998)

    IF(ASSOCIATED(linearMapping)) CALL FlagError("Linear mapping is already associated.",err,error,*998)
    IF(.NOT.ASSOCIATED(vectorMapping)) CALL FlagError("Vector mapping is not associated.",err,error,*999)

    linearMapping=>vectorMapping%linearMapping
    IF(.NOT.ASSOCIATED(linearMapping)) CALL FlagError("Linear mapping is not associated for the vector mapping.",err,error,*999)
       
    EXITS("EquationsMappingVector_LinearMappingGet")
    RETURN
999 NULLIFY(linearMapping)
998 ERRORSEXITS("EquationsMappingVector_LinearMappingGet",err,error)
    RETURN 1
    
  END SUBROUTINE EquationsMappingVector_LinearMappingGet

  !
  !================================================================================================================================
  !

  !>Gets the nonlinear vector mapping for an vector mapping.
  SUBROUTINE EquationsMappingVector_NonlinearMappingGet(vectorMapping,nonlinearMapping,err,error,*)

    !Argument variables
    TYPE(EquationsMappingVectorType), POINTER :: vectorMapping !<A pointer to the equations vector mapping to get the nonlinear mapping for
    TYPE(EquationsMappingNonlinearType), POINTER :: nonlinearMapping !<On exit, a pointer to the nonlinear Mapping in the specified vector equations mapping. Must not be associated on entry
    INTEGER(INTG), INTENT(OUT) :: err !<The error code
    TYPE(VARYING_STRING), INTENT(OUT) :: error !<The error string
    !Local Variables
 
    ENTERS("EquationsMappingVector_NonlinearMappingGet",err,error,*998)

    IF(ASSOCIATED(nonlinearMapping)) CALL FlagError("Nonlinear mapping is already associated.",err,error,*998)
    IF(.NOT.ASSOCIATED(vectorMapping)) CALL FlagError("Vector mapping is not associated.",err,error,*999)

    nonlinearMapping=>vectorMapping%nonlinearMapping
    IF(.NOT.ASSOCIATED(nonlinearMapping))  &
      & CALL FlagError("Nonlinear mapping is not associated for the vector mapping.",err,error,*999)
       
    EXITS("EquationsMappingVector_NonlinearMappingGet")
    RETURN
999 NULLIFY(nonlinearMapping)
998 ERRORSEXITS("EquationsMappingVector_NonlinearMappingGet",err,error)
    RETURN 1
    
  END SUBROUTINE EquationsMappingVector_NonlinearMappingGet

  !
  !================================================================================================================================
  !

  !>Gets the rhs vector mapping for an vector mapping.
  SUBROUTINE EquationsMappingVector_RHSMappingGet(vectorMapping,rhsMapping,err,error,*)

    !Argument variables
    TYPE(EquationsMappingVectorType), POINTER :: vectorMapping !<A pointer to the equations vector mapping to get the rhs mapping for
    TYPE(EquationsMappingRHSType), POINTER :: rhsMapping !<On exit, a pointer to the rhs Mapping in the specified vector equations mapping. Must not be associated on entry
    INTEGER(INTG), INTENT(OUT) :: err !<The error code
    TYPE(VARYING_STRING), INTENT(OUT) :: error !<The error string
    !Local Variables
 
    ENTERS("EquationsMappingVector_RHSMappingGet",err,error,*998)

    IF(ASSOCIATED(rhsMapping)) CALL FlagError("RHS mapping is already associated.",err,error,*998)
    IF(.NOT.ASSOCIATED(vectorMapping)) CALL FlagError("Vector mapping is not associated.",err,error,*999)

    rhsMapping=>vectorMapping%rhsMapping
    IF(.NOT.ASSOCIATED(rhsMapping)) CALL FlagError("RHS mapping is not associated for the vector mapping.",err,error,*999)
       
    EXITS("EquationsMappingVector_RHSMappingGet")
    RETURN
999 NULLIFY(rhsMapping)
998 ERRORSEXITS("EquationsMappingVector_RHSMappingGet",err,error)
    RETURN 1
    
  END SUBROUTINE EquationsMappingVector_RHSMappingGet

  !
  !================================================================================================================================
  !

  !>Gets the source vector mapping for an vector mapping.
  SUBROUTINE EquationsMappingVector_SourceMappingGet(vectorMapping,sourceMapping,err,error,*)

    !Argument variables
    TYPE(EquationsMappingVectorType), POINTER :: vectorMapping !<A pointer to the equations vector mapping to get the source mapping for
    TYPE(EquationsMappingSourceType), POINTER :: sourceMapping !<On exit, a pointer to the source Mapping in the specified vector equations mapping. Must not be associated on entry
    INTEGER(INTG), INTENT(OUT) :: err !<The error code
    TYPE(VARYING_STRING), INTENT(OUT) :: error !<The error string
    !Local Variables
 
    ENTERS("EquationsMappingVector_SourceMappingGet",err,error,*998)

    IF(ASSOCIATED(sourceMapping)) CALL FlagError("Source mapping is already associated.",err,error,*998)
    IF(.NOT.ASSOCIATED(vectorMapping)) CALL FlagError("Vector mapping is not associated.",err,error,*999)

    sourceMapping=>vectorMapping%sourceMapping
    IF(.NOT.ASSOCIATED(sourceMapping)) CALL FlagError("Source mapping is not associated for the vector mapping.",err,error,*999)
       
    EXITS("EquationsMappingVector_SourceMappingGet")
    RETURN
999 NULLIFY(sourceMapping)
998 ERRORSEXITS("EquationsMappingVector_SourceMappingGet",err,error)
    RETURN 1
    
  END SUBROUTINE EquationsMappingVector_SourceMappingGet

  !
  !================================================================================================================================
  !

END MODULE EquationsMappingAccessRoutines